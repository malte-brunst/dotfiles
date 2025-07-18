return {
    {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    opts = {
        ensure_installed = { "lua", "vim", "python", "sql", "markdown", "markdown_inline" },
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        textobject = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner"
                }
            }
        }
    },
    build = ':TSUpdate'
    }
}
