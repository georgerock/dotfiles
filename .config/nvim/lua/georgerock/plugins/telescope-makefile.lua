return {
    'sopa0/telescope-makefile',
    dependencies = {
        'akinsho/nvim-toggleterm.lua',
    },
    after = 'telescope',
    event = 'VeryLazy',
    config = function()
        require('telescope').load_extension('make')
        require('telescope-makefile').setup({
            make_bin = 'make',
            default_target = 'invoke',
            makefile_priority = { '.' },
        })

        vim.keymap.set(
            'n',
            '<leader>tm',
            '<cmd> Telescope make<CR>',
            { desc = 'Toggle make targets' }
        )
    end,
}
