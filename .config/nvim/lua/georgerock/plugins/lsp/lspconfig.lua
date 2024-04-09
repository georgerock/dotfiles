---@diagnostic disable: missing-fields
return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        inlay_hints = {
            enabled = true,
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

            opts.desc = 'Show LSP signature help'
            keymap.set('n', 'K', vim.lsp.buf.hover, opts)

            opts.desc = 'Show LSP code actions'
            keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

            opts.desc = 'Smart rename'
            keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

            opts.desc = 'Go to next diagnostic'
            keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

            opts.desc = 'Go to previous diagnostic'
            keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)

            opts.desc = 'Smart line diagnostics'
            keymap.set('n', '<leader>d', vim.lsp.diagnostic.open_flat, opts)

            opts.desc = 'Smart buffer diagnostics'
            keymap.set(
                'n',
                '<leader>D',
                '<cmd> Telescope diagnostics bufnr=0<CR>',
                opts
            )

            opts.desc = 'Restart lsp'
            keymap.set('n', '<leader>lsr', '<cmd> LspRestart<CR>', opts)
        end

        local capabilities = cmp_nvim_lsp.default_capabilities()
        local signs =
            { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
        for type, icon in pairs(signs) do
            local hl = 'DiagnosticSign' .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
        end

        lspconfig['html'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['lua_ls'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
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
        })

        lspconfig['basedpyright'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['ruff_lsp'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['tsserver'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
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
