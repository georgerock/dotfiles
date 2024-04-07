return {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'folke/todo-comments.nvim' },
    keys = {
        {
            '<leader>tt',
            '<cmd>TroubleToggle<CR>',
            desc = 'Toggle file trouble',
        },
        {
            '<leader>tw',
            '<cmd>TroubleToggle workspace_diagnostics<CR>',
            desc = 'Toggle workspace diagnostics',
        },
        {
            '<leader>tc',
            '<cmd>TodoTrouble<CR>',
            desc = 'Toggle chore list (todos)',
        },
    },
}
