--  Bufferline bindings for got to buffer at index
---@diagnostic disable-next-line: lowercase-global
function buffer_at_index(index)
    vim.cmd('BufferLineGoToBuffer ' .. index)
end

for i = 1, 9 do
    vim.api.nvim_set_keymap(
        'n',
        '<Leader>' .. i,
        ':lua buffer_at_index(' .. i .. ')<CR>',
        { noremap = true, silent = true }
    )
end

vim.keymap.set(
    'n',
    '<leader>ts',
    '<cmd> DBUIToggle<CR>',
    { desc = 'Toggle Storage (Database) UI' }
)
-- Some vs-code like bindings for save and close
vim.api.nvim_set_keymap(
    'n',
    '<C-s>',
    ':w<CR>',
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<C-q>',
    ':q<CR>',
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<C-w>',
    ':Bdelete<CR>',
    { noremap = true, silent = true }
)

vim.keymap.set('n', 'x', '"_x')

vim.keymap.set('n', '<leader>+', '<C-a>', { desc = 'Increment number' })
vim.keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' })
-- window splits

vim.keymap.set(
    'n',
    '<leader>wv',
    ':vsplit<CR>',
    { desc = 'Split windown vertically' }
)
vim.keymap.set(
    'n',
    '<leader>wh',
    ':split<CR>',
    { desc = 'Split windown horizontally' }
)
vim.keymap.set(
    'n',
    '<leader>we',
    '<C-w>=',
    { desc = 'Make split windows equal' }
)
vim.keymap.set(
    'n',
    '<leader>wx',
    ':close<CR>',
    { desc = 'Close current split window' }
)

vim.keymap.set(
    'n',
    '<leader>/',
    '<cmd> nohl<CR>',
    { desc = 'Clear search highlights' }
)

vim.keymap.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)')
vim.keymap.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)')
vim.keymap.set({ 'n', 'x' }, 'gp', '<Plug>(YankyGPutAfter)')
vim.keymap.set({ 'n', 'x' }, 'gP', '<Plug>(YankyGPutBefore)')

vim.keymap.set('n', '<c-p>', '<Plug>(YankyPreviousEntry)')
vim.keymap.set('n', '<c-n>', '<Plug>(YankyNextEntry)')

vim.keymap.set('n', ']p', '<Plug>(YankyPutIndentAfterLinewise)')
vim.keymap.set('n', '[p', '<Plug>(YankyPutIndentBeforeLinewise)')
vim.keymap.set('n', ']P', '<Plug>(YankyPutIndentAfterLinewise)')
vim.keymap.set('n', '[P', '<Plug>(YankyPutIndentBeforeLinewise)')

vim.keymap.set('n', '>p', '<Plug>(YankyPutIndentAfterShiftRight)')
vim.keymap.set('n', '<p', '<Plug>(YankyPutIndentAfterShiftLeft)')
vim.keymap.set('n', '>P', '<Plug>(YankyPutIndentBeforeShiftRight)')
vim.keymap.set('n', '<P', '<Plug>(YankyPutIndentBeforeShiftLeft)')

vim.keymap.set('n', '=p', '<Plug>(YankyPutAfterFilter)')
vim.keymap.set('n', '=P', '<Plug>(YankyPutBeforeFilter)')

vim.keymap.set({ 'n', 'x' }, 'x', 'd', { noremap = true, desc = 'Cut' })
vim.keymap.set({ 'n', 'x' }, 'xx', 'dd', { noremap = true, desc = 'Cut line' })

-- add newlines below/above cursor in normal mode
vim.keymap.set('n', '<CR>', 'm`o<Esc>``')
vim.keymap.set('n', '<C-CR>', 'm`O<Esc>``')
