return {
    'echasnovski/mini.files',
    version = false,
    config = function()
        require('mini.files').setup()

        -- Keybindings
        vim.api.nvim_set_keymap('n', '-', '<cmd>lua MiniFiles.open()<CR>', {})
    end,
}
