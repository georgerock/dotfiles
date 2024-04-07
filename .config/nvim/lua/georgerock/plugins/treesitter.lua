return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        local configs = require('nvim-treesitter.configs')

        configs.setup({
            ensure_installed = {
                'lua',
                'python',
                'typescript',
                'javascript',
                'rust',
                'sql',
            },
            auto_install = true,
            sync_insatll = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
