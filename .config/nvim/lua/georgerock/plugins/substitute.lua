return {
    'gbprod/substitute.nvim',
    dependencies = {
        'gbprod/yanky.nvim',
    },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local substitute = require('substitute')

        substitute.setup({
            on_substitute = require('yanky.integration').substitute(),
        })

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
            'x',
            's',
            substitute.visual,
            { desc = 'Substitute in visual mode', noremap = true }
        )
    end,
}
