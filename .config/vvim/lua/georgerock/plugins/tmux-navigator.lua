return {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    config = function()
        vim.keymap.set({"n", "v", "i"}, "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
        vim.keymap.set({"n", "v", "i"}, "<C-l>", "<cmd> TmuxNavigateRight<CR>")
        vim.keymap.set({"n", "v", "i"}, "<C-k>", "<cmd> TmuxNavigateUp<CR>")
        vim.keymap.set({"n", "v", "i"}, "<C-j>", "<cmd> TmuxNavigateDown<CR>")
    end,
}
