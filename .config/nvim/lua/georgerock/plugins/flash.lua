return {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {},
    config = function()
        local wk = require('which-key')
        wk.register({
            name = 'Flash',
            s = {
                function()
                    require('flash').jump()
                end,
                'Flash jump',
            },
            S = {
                function()
                    require('flash').treesitter()
                end,
                'Treesitter flash',
            },
        }, { prefix = '<leader>' })
    end,
}
