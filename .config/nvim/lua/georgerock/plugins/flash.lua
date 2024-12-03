return {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {},
    config = function()
        vim.keymap.set("n", "<leader>s", require('flash').jump, {desc = "Flash jump"})
        vim.keymap.set("n", "<leader>S", require('flash').treesitter, {desc = "Flash treesitter"})
    end,
}
