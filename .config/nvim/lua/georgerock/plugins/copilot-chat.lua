return {
    {
        'CopilotC-Nvim/CopilotChat.nvim',
        branch = 'canary',
        event = 'VeryLazy',
        dependencies = {
            { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
            { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
        },
        config = function()
            require('CopilotChat').setup()
            vim.keymap.set(
                'n',
                '<leader>th',
                '<cmd> CopilotChatToggle<CR>',
                { desc = 'Toggle Copilot Chat' }
            )
        end,
    },
}
