return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        local configs = require('nvim-treesitter.configs')

        configs.setup({
            ensure_installed = {
                'lua',
                'python',
                'java',
                'kotlin',
                'c',
                'astro',
                'html',
                'css',
                'typescript',
                'javascript',
                'rust',
                'sql',
                'toml',
                'yaml',
                'json',
                'gitignore',
                'dockerfile',
            },
            auto_install = true,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<C-space>',
                    node_incremental = '<C-space>',
                    scope_incremental = false,
                    node_decremental = '<bs>',
                },
            },
        })
    end,
}
