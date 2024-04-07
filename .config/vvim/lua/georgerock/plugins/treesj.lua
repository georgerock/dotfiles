return {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
        require('treesj').setup({})
        vim.keymap.set('n', '<leader>m', function()
            require('treesj').toggle()
        end, { desc = 'Toggle split/join treesitter' })
    end,
}
