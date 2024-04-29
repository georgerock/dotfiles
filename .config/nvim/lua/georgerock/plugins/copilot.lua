return {
    'github/copilot.vim',
    config = function()
        require('copilot').setup({})
        vim.cmd(':Copilot disable')
    end,
}
