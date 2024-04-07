return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim', 'davvid/telescope-git-grep.nvim' },
    config = function()
        local builtin = require('telescope.builtin')

        vim.keymap.set(
            'n',
            '<leader>pf',
            builtin.find_files,
            { desc = 'Find project files' }
        )
        vim.keymap.set(
            'n',
            '<leader>pF',
            builtin.git_files,
            { desc = 'Find git files' }
        )
        vim.keymap.set('n', '<leader>ps', function()
            vim.ui.input('Enter search term: ', function(term)
                builtin.grep_string({ search = term })
            end)
        end, { desc = 'Search project for string' })

        vim.keymap.set(
            'n',
            '<leader>pS',
            '<cmd> Telescope git_grep live_grep<CR>',
            { desc = 'Search git for string' }
        )
    end,
}
