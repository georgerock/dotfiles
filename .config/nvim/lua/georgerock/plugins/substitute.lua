return {
    'gbprod/substitute.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local substitute = require('substitute')

        substitute.setup()

        vim.keymap.set(
            'n',
            's',
            substitute.operator,
            { desc = 'Substitute motion', noremap = true }
        )
        vim.keymap.set(
            'n',
            'ss',
            substitute.line,
            { desc = 'Substitute entire line', noremap = true }
        )
        vim.keymap.set(
            'n',
            'S',
            substitute.eol,
            { desc = 'Substitute end of line', noremap = true }
        )
        vim.keymap.set(
            'x',
            's',
            substitute.visual,
            { desc = 'Substitute in visual mode', noremap = true }
        )
    end,
}
