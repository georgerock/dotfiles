return {
    'stevearc/conform.nvim',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out
    config = function()
        local conform = require('conform')

        conform.setup({
            formatters_by_ft = {
                javascript = { 'prettier' },
                typescript = { 'prettier' },
                javascriptreact = { 'prettier' },
                typescriptreact = { 'prettier' },
                astro = { 'prettierd' },
                svelte = { 'prettier' },
                css = { 'prettier' },
                html = { 'prettier' },
                json = { 'prettier' },
                yaml = { 'prettier' },
                markdown = { 'prettier' },
                graphql = { 'prettier' },
                lua = { 'stylua' },
                python = { 'black' },
                rust = { 'rustfmt' },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 5000,
            },
        })

        vim.keymap.set({ 'n', 'v' }, '<leader>fm', function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 5000,
            })
        end, { desc = 'Format file or range (in visual mode)' })
    end,
}
