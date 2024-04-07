return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'davvid/telescope-git-grep.nvim',
        'folke/todo-comments.nvim',
    },
    config = function()
        local builtin = require('telescope.builtin')

        vim.keymap.set(
            'n',
            '<leader>ff',
            builtin.find_files,
            { desc = 'Find project files' }
        )
        vim.keymap.set(
            'n',
            '<leader>fg',
            builtin.git_files,
            { desc = 'Find git files' }
        )
        vim.keymap.set(
            'n',
            '<leader>fs',
            builtin.live_grep,
            { desc = 'Search project for string' }
        )

        vim.keymap.set(
            'n',
            '<leader>fS',
            '<cmd> Telescope git_grep live_grep<CR>',
            { desc = 'Search git for string' }
        )

        vim.keymap.set('n', '<leader>ft', '<cmd> TodoTelescope<CR>')
    end,
}
