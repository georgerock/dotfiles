return {
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
                        return ']c'
                    end
                    vim.schedule(function()
                        gs.next_hunk()
                    end)
                    return '<Ignore>'
                end, { expr = true })

                map('n', '[c', function()
                    if vim.wo.diff then
                        return '[c'
                    end
                    vim.schedule(function()
                        gs.prev_hunk()
                    end)
                    return '<Ignore>'
                end, { expr = true })

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
                map('n', '<leader>hd', gs.diffthis, { desc = 'Git diff this' })

                -- Text object
                map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
            end,
        })
    end,
}
