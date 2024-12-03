return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
        require('catppuccin').setup({
            flavour = 'mocha',
            transparent_background = true,
            integrations = {
                barbecue = {
                    dim_context = true,
                    alt_background = true,
                },
                cmp = true,
                notify = true,
                gitsigns = true,
                flash = true,
                indent_blankline = {
                    enabled = true,
                    colored_indent_levels = true,
                },
                treesitter = true,
                mason = true,
                neogit = true,
                noice = true,
                which_key = true,
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
        })
    end,
}
