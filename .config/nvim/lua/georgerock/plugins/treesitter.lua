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
            textobjects = {
                select = {
                    enable = true,
                    include_surrounding_whitespace = true,
                    lookahead = true,
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ['ai'] = {
                            query = '@conditional.outer',
                            desc = 'Select around a conditional (if)',
                        },
                        ['ii'] = {
                            query = '@conditional.inner',
                            desc = 'Select innper part of a conditional',
                        },
                        ['al'] = {
                            query = '@loop.outer',
                            desc = 'Select around a loop',
                        },
                        ['il'] = {
                            query = '@loop.inner',
                            desc = 'Select inner part of a loop',
                        },
                        ['af'] = {
                            query = '@function.outer',
                            desc = 'Select around a function',
                        },
                        ['if'] = {
                            query = '@function.inner',
                            desc = 'Select the inner part of a function',
                        },
                        ['aa'] = {
                            query = '@assignment.outer',
                            desc = 'Select around an assignment',
                        },
                        [':='] = {
                            query = '@assignment.lhs',
                            desc = 'Select the left side of assignemnt',
                        },
                        ['=:'] = {
                            query = '@assignment.rhs',
                            desc = 'Select the right side of assignment',
                        },
                        ['ac'] = {
                            query = '@call.inner',
                            desc = 'Select around a function call',
                        },
                        ['ic'] = {
                            query = '@call.outer',
                            desc = 'Select the inner part of a call',
                        },
                    },
                    selection_modes = {
                        ['@loop.inner'] = 'v',
                        ['@loop.outer'] = 'v',
                        ['@conditional.inner'] = 'v',
                        ['@conditional.outer'] = 'v',
                        ['@parameter.outer'] = 'v', -- charwise
                        ['@function.outer'] = 'v', -- charwise
                        ['@function.inner'] = 'v',
                        ['@class.outer'] = '<c-v>', -- blockwise
                        ['@assignment.outer'] = 'v',
                        ['@assignment.lhs'] = 'v',
                        ['@assignment.rhs'] = 'v',
                        ['@call.inner'] = 'v',
                        ['@call.outer'] = 'v',
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ['<leader>a'] = '@parameter.inner',
                    },
                    swap_previous = {
                        ['<leader>A'] = '@parameter.inner',
                    },
                },
            },
        })
    end,
}
