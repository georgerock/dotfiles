return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        'jay-babu/mason-nvim-dap.nvim',
    },
    config = function()
        local mason = require('mason')
        local mason_lspconfig = require('mason-lspconfig')
        local mason_tool_installer = require('mason-tool-installer')
        local mason_dap = require('mason-nvim-dap')

        mason.setup({
            ui = {
                icons = {
                    package_installed = '',
                    package_uninstalled = '',
                    package_outdated = '',
                    package_pending = '',
                },
            },
        })

        mason_dap.setup({
            ensure_installed = {
                'python',
                'node2',
                'chrome',
                'firefox',
                'js',
            },
        })

        mason_lspconfig.setup({
            ensure_installed = {
                'lua_ls',
                'rust_analyzer',
                'pyright',
                'basedpyright',
                'ruff_lsp',
                'tsserver',
                'jsonls',
                'eslint',
                'taplo', -- TOML
                'html',
                'sqlls',
                'cssls',
                'tailwindcss',
                'graphql',
                'dockerls',
                'docker_compose_language_service',
                'hydra_lsp', -- YAML
                'lemminx', -- XML
            },
            automatic_installation = true,
        })

        mason_tool_installer.setup({
            ensure_installed = {
                'prettier',
                'eslint_d',
                'ruff',
                'pylint',
                'stylua',
                'black',
                'isort',
                'autopep8',
                'rustfmt',
            },
        })
    end,
}
