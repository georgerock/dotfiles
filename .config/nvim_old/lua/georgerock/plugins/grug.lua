return {
    'MagicDuck/grug-far.nvim',
    config = function()
        require('grug-far').setup()
        vim.api.nvim_set_keymap(
            'n',
            '<leader>tr',
            '<cmd> GrugFar<CR>',
            { desc = 'Toggle find and replace' }
        )
    end,
}
