return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "onsails/lspkind.nvim",
        "L3MON4D3/LuaSnip",
        "benfowler/telescope-luasnip.nvim",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-cmdline"
    },
    opts = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        local luasnip = require("luasnip")
        return {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = {
                ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
                ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
                ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
                ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
                ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
                ['<C-c>'] = cmp.mapping(cmp.mapping.close(), { 'i', 'c' }),
                ["<C-y>"] = cmp.mapping(
                    cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true,
                    },
                    { "i", "c" }
                )
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'nvim_lsp_signature_help' },
                { name = 'luasnip' },
                { name = 'buffer',                 keyword_length = 3 },
                { name = 'path' },
                { name = 'nvim_lsp_signature_help' },
                { name = 'cmdline',                keyword_length = 3 }
            }),
            formatting = {
                format = lspkind.cmp_format {
                    with_text = true,
                    menu = {
                        buffer = "[Buf]",
                        nvim_lsp = "[LSP]",
                        path = "[Path]",
                        luasnip = "[Snip]",
                        nvim_lsp_signature_help = "[LSP]",
                        dictionary = "[Dictionary]"
                    },
                },
            },
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer', keyword_length = 3 }
                },
            }),
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path', keyword_length = 3 }
                }, {
                    { name = 'cmdline', keyword_length = 3 }
                }),
                matching = { disallow_symbol_nonprefix_matching = false }
            })
        }
    end
}
