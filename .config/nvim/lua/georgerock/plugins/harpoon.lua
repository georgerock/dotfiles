return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        local harpoon = require('harpoon')
        harpoon.setup()

        local km = vim.keymap
        km.set('n', '<leader>ha', function()
            harpoon:list():append()
        end, { desc = 'Harpoon add' })

        km.set('n', '<leader>hs', function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = 'Harpoon quick menu' })

        km.set('n', '<M-1>', function()
            harpoon:list():select(1)
        end)

        km.set('n', '<M-2>', function()
            harpoon:list():select(2)
        end)

        km.set('n', '<M-3>', function()
            harpoon:list():select(3)
        end)

        km.set('n', '<M-4>', function()
            harpoon:list():select(4)
        end)
    end,
}
