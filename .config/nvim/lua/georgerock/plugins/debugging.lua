return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'nvim-neotest/nvim-nio',
        'rcarriga/nvim-dap-ui',
        'leoluz/nvim-dap-go',
        "mfussenegger/nvim-dap-python",
        "nvim-java/nvim-java-dap",
    },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')
        local km = vim.keymap

        dapui.setup()

        require('dap-go').setup()
        require("dap-python").setup("python3")

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end

        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end

        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end

        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        km.set(
            'n',
            '<leader>db',
            dap.toggle_breakpoint,
            { desc = 'Toggle breakpoint' }
        )
        km.set('n', '<leader>dc', dap.continue, { desc = 'Continue' })
        km.set('n', '<leader>do', dap.step_over, { desc = 'Step Over' })
        km.set('n', '<leader>di', dap.step_into, { desc = 'Step into' })
        km.set('n', '<leader>du', dap.step_out, { desc = 'Step out' })
        km.set('n', '<leader>dp', dap.step_back, { desc = 'Step back' })
        km.set('n', '<leader>dq', dap.terminate, { desc = 'Terminate debug session' })
    end,
}
