---@diagnostic disable: missing-fields
return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        opts = {
            inlay_hints = {
                enabled = true,
            },
        },
    },
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        { 'antosha417/nvim-lsp-file-operations', config = true },
    },
    config = function()
        local lspconfig = require('lspconfig')
        local cmp_nvim_lsp = require('cmp_nvim_lsp')
        local keymap = vim.keymap
        local opts = { noremap = true, silent = true }
        local telescope = require('telescope.builtin')

        require('neoconf').setup()

        local on_attach = function(_, bufnr)
            opts.buffer = bufnr

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
            keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        end

        local capabilities = cmp_nvim_lsp.default_capabilities()
        local signs = { Error = ' ', Warn = ' ', Info = ' ' }
        for type, icon in pairs(signs) do
            local hl = 'DiagnosticSign' .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
        end

        vim.lsp.handlers['textDocument/publishDiagnostics'] =
            vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                underline = true,
                virtual_text = {
                    spacing = 4,
                    severity_limit = 'Warning',
                },
                signs = true,
                update_in_insert = false,
            })

        lspconfig['html'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['lua_ls'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    hint = {
                        enable = true,
                    },
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT',
                        path = vim.split(package.path, ';'),
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { 'vim' },
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files and plugins
                        library = { vim.env.VIMRUNTIME },
                        checkThirdParty = false,
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })

        lspconfig['rust_analyzer'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            inlayHints = {
                bindingModeHints = {
                    enable = false,
                },
                chainingHints = {
                    enable = true,
                },
                closingBraceHints = {
                    enable = true,
                    minLines = 25,
                },
                closureReturnTypeHints = {
                    enable = 'never',
                },
                lifetimeElisionHints = {
                    enable = 'never',
                    useParameterNames = false,
                },
                maxLength = 25,
                parameterHints = {
                    enable = true,
                },
                reborrowHints = {
                    enable = 'never',
                },
                renderColons = true,
                typeHints = {
                    enable = true,
                    hideClosureInitialization = false,
                    hideNamedConstructor = false,
                },
            },
        })

        lspconfig['basedpyright'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                basedpyright = {
                    analysis = {
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                        diagnosticMode = 'workspace',
                    },
                },
            },
            handlers = {
                ['textDocument/publishDiagnostics'] = vim.lsp.with(
                    vim.lsp.diagnostic.on_publish_diagnostics,
                    {
                        -- Disable hint severity
                        severity_sort = true,
                        virtual_text = {
                            severity_limit = 'Warning',
                        },
                    }
                ),
            },
        })

        lspconfig['gopls'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                hints = {
                    rangeVariableTypes = true,
                    parameterNames = true,
                    constantValues = true,
                    assignVariableTypes = true,
                    compositeLiteralFields = true,
                    compositeLiteralTypes = true,
                    functionTypeParameters = true,
                },
            },
        })

        lspconfig['ruff_lsp'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['denols'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                deno = {
                    inlayHints = {
                        parameterNames = {
                            enabled = 'all',
                            suppressWhenArgumentMatchesName = true,
                        },
                        parameterTypes = { enabled = true },
                        variableTypes = {
                            enabled = true,
                            suppressWhenTypeMatchesName = true,
                        },
                        propertyDeclarationTypes = { enabled = true },
                        functionLikeReturnTypes = { enable = true },
                        enumMemberValues = { enabled = true },
                    },
                },
            },
        })

        lspconfig['tsserver'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                typescript = {
                    inlayHints = {
                        includeInlayParameterNameHints = 'all',
                        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                    },
                },
                javascript = {
                    inlayHints = {
                        includeInlayParameterNameHints = 'all',
                        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                    },
                },
            },
        })

        lspconfig['jsonls'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['eslint'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['taplo'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['cssls'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['tailwindcss'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['graphql'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['dockerls'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['docker_compose_language_service'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['hydra_lsp'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['lemminx'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['sqlls'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
    end,
}
