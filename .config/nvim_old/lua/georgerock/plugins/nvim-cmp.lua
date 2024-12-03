return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        'hrsh7th/cmp-buffer', -- text in buffer
        'hrsh7th/cmp-path', -- file paths
        'L3MON4D3/LuaSnip', -- snippet engine
        'saadparwaiz1/cmp_luasnip', -- LuaSnip completion source
        'rafamadriz/friendly-snippets', -- snippets a la VsCode
        'onsails/lspkind-nvim', -- icons for completion items
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        local lspkind = require('lspkind')

        require('luasnip.loaders.from_vscode').lazy_load()

        cmp.setup({
            completion = {
                completeopt = 'menu,menuone,preview,noinsert',
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = {
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
                -- ['<C-Space>'] = cmp.mapping.complete(), --show suggestions
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-e>'] = cmp.mapping.abort(), -- close suggestion window
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'vim-dadbod-completion' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path' },
            }),
            formatting = {
                format = lspkind.cmp_format({
                    ellipsis_char = '...',
                    maxwidth = 50,
                }),
            },
        })
    end,
}
