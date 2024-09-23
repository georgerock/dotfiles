return {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
        {
            '<leader>tt',
            '<cmd>Trouble diagnostics toggle<cr>',
            desc = 'Toggle Diagnostics (Trouble)',
        },
        {
            '<leader>ta',
            '<cmd>Trouble symbols toggle focus=false<cr>',
            desc = 'Toggle Symbols outline (Trouble)',
        },
        {
            '<leader>tl',
            '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
            desc = 'Toggle LSP Definitions / references / ... (Trouble)',
        },
    },
}
