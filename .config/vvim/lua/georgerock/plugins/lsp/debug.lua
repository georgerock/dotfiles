return {
    {
        'mfussenegger/nvim-dap',
        config = function()
            local dap = require('dap')

            vim.keymap.set('n', '<leader>b', function()
                dap.toggle_breakpoint()
            end, { desc = 'Toggle breakpoint' })

            vim.keymap.set('n', '<leader>B', function()
                dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
            end, { desc = 'Set breakpoint condition' })

            vim.keymap.set('n', '<leader>lp', function()
                dap.set_breakpoint(
                    nil,
                    nil,
                    vim.fn.input('Log point message: ')
                )
            end, { desc = 'Set log point' })

            vim.keymap.set('n', '<leader>dr', function()
                dap.repl.open()
            end, { desc = 'Open REPL' })

            vim.keymap.set('n', '<leader>td', function()
                dap.continue()
            end, { desc = 'Toggle debug adapater (continue)' })
        end,
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
        config = function()
            require('neodev').setup({
                library = { plugins = { 'nvim-dap-ui' }, types = true },
            })
        end,
    },
    -- Actual debuggers
    {
        'mfussenegger/nvim-dap-python',
        ft = 'python',
        config = function()
            require('dap-python').setup(
                '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'
            )
        end,
    },
}
