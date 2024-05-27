return {
    'm4xshen/hardtime.nvim',
    dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
    event = 'VeryLazy',
    opts = {
        disabled_keys = {
            ['<Up>'] = { 'n', 'x' },
            ['<Down>'] = { 'n', 'x' },
            ['<Left>'] = { 'n', 'x' },
            ['<Right>'] = { 'n', 'x' },
        },
    },
}
