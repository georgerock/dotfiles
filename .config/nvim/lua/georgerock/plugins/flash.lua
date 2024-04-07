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
                'Flash treesitter',
            },
            r = {
                function()
                    require('flash').jump({
                        remote_op = {
                            restore = true,
                            motion = true,
                        },
                    })
                end,
                'Flash remote',
            },
            R = {
                function()
                    require('flash').remote_treesitter()
                end,
                'Flash treesitter search',
            },
        }, { prefix = '<leader>' })
    end,
}
