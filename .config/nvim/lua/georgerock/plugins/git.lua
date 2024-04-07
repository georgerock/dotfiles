return {
    {
        'NeogitOrg/neogit',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'sindrets/diffview.nvim',
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            require('neogit').setup({})

            vim.keymap.set(
                'n',
                '<leader>gs',
                '<cmd> Neogit<CR>',
                { desc = 'Git status' }
            )

            vim.keymap.set(
                'n',
                '<leader>gl',
                '<cmd> Telescope git_commits<CR>',
                { desc = 'Git log' }
            )

            vim.keymap.set(
                'n',
                '<leader>gp',
                '<cmd> Neogit pull<CR>',
                { desc = 'Git pull' }
            )

            vim.keymap.set(
                'n',
                '<leader>gP',
                '<cmd> Neogit push<CR>',
                { desc = 'Git push' }
            )

            vim.keymap.set(
                'n',
                '<leader>gc',
                '<cmd> Neogit commit<CR>',
                { desc = 'Git commit' }
            )

            vim.keymap.set(
                'n',
                '<leader>gB',
                '<cmd> Neogit branch<CR>',
                { desc = 'Git branch' }
            )
        end,
    },
    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set(
                'n',
                '<leader>gb',
                '<cmd> Git blame<CR>',
                { desc = 'Git blame' }
            )
        end,
    },
    {
        'lewis6991/gitsigns.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            require('gitsigns').setup({
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', ']c', function()
                        if vim.wo.diff then
                            return ']h'
                        end
                        vim.schedule(function()
                            gs.next_hunk()
                        end)
                        return '<Ignore>'
                    end, { expr = true, desc = 'Next hunk' })

                    map('n', '[c', function()
                        if vim.wo.diff then
                            return '[h'
                        end
                        vim.schedule(function()
                            gs.prev_hunk()
                        end)
                        return '<Ignore>'
                    end, {
                        expr = true,
                        desc = 'Previous hunk',
                    })

                    -- Actions
                    map(
                        'n',
                        '<leader>hr',
                        gs.reset_hunk,
                        { desc = 'Git reset hunk' }
                    )
                    map(
                        'n',
                        '<leader>hR',
                        gs.reset_buffer,
                        { desc = 'Git reset buffer' }
                    )
                    map(
                        'n',
                        '<leader>hp',
                        gs.preview_hunk,
                        { desc = 'Git preview hunk' }
                    )
                    map('n', '<leader>hb', function()
                        gs.blame_line({ full = true })
                    end, { desc = 'Git blame line' })
                    map(
                        'n',
                        '<leader>tb',
                        gs.toggle_current_line_blame,
                        { desc = 'Toggle blame line' }
                    )
                    map(
                        'n',
                        '<leader>hd',
                        gs.diffthis,
                        { desc = 'Git diff this' }
                    )

                    -- Text object
                    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                end,
            })
        end,
    },
}
