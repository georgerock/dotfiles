return {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local mocha = require('catppuccin.palettes').get_palette('mocha')
        require('bufferline').setup({
            options = {
                mode = 'buffers',
                offsets = {
                    {
                        filetype = 'neo-tree',
                        text = 'File Explorer',
                        padding = 0,
                        separator = true,
                        text_align = 'center',
                    },
                },
                numbers = 'ordinal',
                show_close_icon = false,
                show_buffer_close_icons = false,
                diagnostics = 'nvim_lsp',
                underline_indicator = true,
                separator_style = 'slope',
                styles = { 'italic', 'bold' },
                custom = {
                    all = {
                        fill = { bg = '#000000' },
                    },
                    mocha = {
                        background = { fg = mocha.text },
                    },
                    latte = {
                        background = { fg = '#000000' },
                    },
                },
            },
        })

        vim.keymap.set('n', '<Tab>', '<cmd> BufferLineCycleNext<CR>')
        vim.keymap.set('n', '<S-Tab>', '<cmd> BufferLineCyclePrev<CR>')
    end,
}