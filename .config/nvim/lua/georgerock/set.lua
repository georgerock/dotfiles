vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

vim.opt.wrap = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 15

vim.opt.updatetime = 50
vim.cmd([[ autocmd RecordingEnter * set cmdheight=1 ]])
vim.cmd([[ autocmd RecordingLeave * set cmdheight=0 ]])
vim.opt.showcmd = true

vim.opt.cursorline = true
vim.opt.signcolumn = 'yes:1'
vim.opt.backspace = 'indent,eol,start'
vim.opt.clipboard:append('unnamedplus')

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.path:append('**')
vim.opt.wildignore:append('*/node_modules/*')
vim.opt.wildignore:append('*/.venv/*')
-- Persist undo history across sessions
vim.opt.undofile = true

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight yanked text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
