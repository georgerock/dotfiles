---@diagnostic disable: missing-fields
return {
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end,
    },
    {
        'jay-babu/mason-nvim-dap.nvim',
        config = function()
            require('mason-nvim-dap').setup({
                ensure_installed = {
                    'python',
                    'delve',
                    'js',
                    'javadbg',
                    'coreclr',
                },
            })
        end,
    },
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        config = function()
            require('mason-tool-installer').setup({
                ensure_installed = {
                    'prettier',
                    'eslint',
                    'ruff',
                    'isort',
                },
            })
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'jdtls',
                    'kotlin_language_server',
                    'astro',
                    'lua_ls',
                    'denols',
                    'clangd',
                    'rust_analyzer',
                    'pyright',
                    'basedpyright',
                    'ruff_lsp',
                    'ts_ls',
                    'jsonls',
                    'eslint',
                    'taplo', -- TOML
                    'astro',
                    'html',
                    'sqlls',
                    'cssls',
                    'tailwindcss',
                    'graphql',
                    'dockerls',
                    'docker_compose_language_service',
                    'hydra_lsp', -- YAML
                    'lemminx', -- XML
                },
                automatic_installation = true,
            })
        end,
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            { 'antosha417/nvim-lsp-file-operations', config = true },
        },
        event = { 'BufReadPre', 'BufNewFile' },
        opts = {
            opts = {
                inlay_hints = {
                    enabled = true,
                },
            },
        },
        config = function()
            local lspconfig = require('lspconfig')
            local cmp_nvim_lsp = require('cmp_nvim_lsp')
            local opts = { noremap = true, silent = true }
            local keymap = vim.keymap
            local telescope = require('telescope.builtin')

            require('neoconf').setup()

            local capabilities = cmp_nvim_lsp.default_capabilities()
            local signs = { Error = ' ', Warn = ' ', Info = ' ' }
            for type, icon in pairs(signs) do
                local hl = 'DiagnosticSign' .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
            end
            local on_attach = function(client, bufnr)
                opts.buffer = bufnr

                if client.supports_method('textDocument/formatting') then
                    local format_on_save = vim.api.nvim_create_augroup(
                        'LspFormatting',
                        { clear = true }
                    )
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        group = format_on_save,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({
                                bufnr = bufnr,
                                filter = function(_client)
                                    return _client.name == 'null-ls'
                                end,
                            })
                        end,
                    })
                end

                -- keybinds
                opts.desc = 'Show LSP references'
                keymap.set('n', 'gr', telescope.lsp_references, opts)

                opts.desc = 'Show LSP declarations'
                keymap.set('n', 'gd', telescope.lsp_definitions, opts)

                opts.desc = 'Show LSP implementations'
                keymap.set('n', 'gi', telescope.lsp_implementations, opts)

                opts.desc = 'Show LSP code actions'
                keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

                opts.desc = 'Smart rename'
                keymap.set('n', '<leader>cn', vim.lsp.buf.rename, opts)
            end

            vim.lsp.handlers['textDocument/publishDiagnostics'] =
                vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                    underline = true,
                    virtual_text = {
                        spacing = 4,
                        min = vim.diagnostic.severity.WARN,
                    },
                    signs = true,
                    update_in_insert = false,
                })

            -- LSP config by language
            lspconfig.lua_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        hint = {
                            enable = true,
                        },
                        runtime = {
                            version = 'LuaJIT',
                            path = vim.split(package.path, ';'),
                        },
                        dagnostics = {
                            globals = { 'vim' },
                        },
                        workspace = {
                            library = { vim.env.VIMRUNTIME },
                            checkThirdParty = true,
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            lspconfig.basedpyright.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                handlers = {
                    ['textDocument/publishDiagnostics'] = vim.lsp.with(
                        vim.lsp.diagnostic.on_publish_diagnostics,
                        {
                            -- Disable hint severity
                            severity_sort = true,
                            virtual_text = {
                                min = vim.diagnostic.severity.WARN,
                            },
                        }
                    ),
                },
            })
        end,
    },
}
