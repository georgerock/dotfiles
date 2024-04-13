return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    integrations = {
        aerial = true,
        barbecue = {
            dim_context = true,
            alt_background = true,
        },
        cmp = true,
        gitsigns = true,
        flash = true,
        harpoon = true,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
        },
        treesitter = true,
        mason = true,
        neotree = true,
        neogit = true,
        noice = true,
        which_key = true,
        octo = true,
        lsp_trouble = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { 'italic' },
                hints = { 'italic' },
                warnings = { 'italic' },
                information = { 'italic' },
            },
            underlines = {
                errors = { 'underline' },
                hints = { 'underline' },
                warnings = { 'underline' },
                information = { 'underline' },
            },
            inlay_hints = {
                background = true,
            },
        },
    },
    config = function()
        require('catppuccin').setup({
            flavour = 'mocha',
            transparent_background = true,
        })
    end,
}
