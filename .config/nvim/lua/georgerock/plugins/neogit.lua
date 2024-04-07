return {
    {
        'NeogitOrg/neogit',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'sindrets/diffview.nvim',
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            require('neogit').setup({})

            vim.keymap.set(
                'n',
                '<leader>gs',
                '<cmd> Neogit<CR>',
                { desc = 'Git status' }
            )

            vim.keymap.set(
                'n',
                '<leader>gl',
                '<cmd> Telescope git_commits<CR>',
                { desc = 'Git log' }
            )

            vim.keymap.set(
                'n',
                '<leader>gp',
                '<cmd> Neogit pull<CR>',
                { desc = 'Git pull' }
            )

            vim.keymap.set(
                'n',
                '<leader>gP',
                '<cmd> Neogit push<CR>',
                { desc = 'Git push' }
            )

            vim.keymap.set(
                'n',
                '<leader>gc',
                '<cmd> Neogit commit<CR>',
                { desc = 'Git commit' }
            )
        end,
    },
    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set(
                'n',
                '<leader>gb',
                '<cmd> Git blame<CR>',
                { desc = 'Git blame' }
            )
        end,
    },
}
