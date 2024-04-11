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