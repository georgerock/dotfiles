return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    integrations = {
        cmp = true,
        gitsigns = true,
        treesitter = true,
        mason = true,
        neotree = true,
        which_key = true,
    },
    config = function()
        require('catppuccin').setup({
            flavour = 'mocha',
            transparent_background = true,
        })
    end,
}
