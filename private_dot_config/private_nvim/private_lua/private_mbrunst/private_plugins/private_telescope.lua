return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { "<leader>t",   "<cmd>Telescope<cr>",                                                                                   "n", unique = true, desc = "Open Telescope" },
        { "<leader>ff",  function() require("telescope.builtin").find_files({ hidden = true }) end,                              "n", unique = true, desc = "Telescope files (incl. hidden files)" },
        { "<leader>fb",  function() require("telescope.builtin").buffers() end,                                                  "n", unique = true, desc = "Telescope buffers" },
        { "<leader>fg",  function() require("telescope.builtin").live_grep() end,                                                "n", unique = true, desc = "Telescope live grep" },
        { "<leader>fw",  function() require("telescope.builtin").grep_string() end,                                              "n", unique = true, desc = "Telescope grep string" },
        { "<leader>fm",  function() require("telescope.builtin").marks() end,                                                    "n", unique = true, desc = "Telescope marks" },
        { "<leader>f:",  function() require("telescope.builtin").command_history() end,                                          "n", unique = true, desc = "Telescope command history" },
        { "<leader>f/",  function() require("telescope.builtin").search_history() end,                                           "n", unique = true, desc = "Telescope search history" },
        { "<leader>fq",  function() require("telescope.builtin").quickfix() end,                                                 "n", unique = true, desc = "Telescope quickfix list" },
        { "<leader>fl",  function() require("telescope.builtin").loclist() end,                                                  "n", unique = true, desc = "Telescope loc list" },
        { "<leader>fr",  function() require("telescope.builtin").registers() end,                                                "n", unique = true, desc = "Telescope registers" },
        { "<c-r>r",      function() require("telescope.builtin").registers() end,                                                "i", unique = true, desc = "Telescope registers (insert mode)" },
        { "<leader>fib", function() require("telescope.builtin").current_buffer_fuzzy_find() end,                                "n", unique = true, desc = "Telescope current buffer fuzzy find" },
        { "<leader>ft",  function() require("telescope.builtin").treesitter() end,                                               "n", unique = true, desc = "Telescope treesitter" },
        { "<leader>fh",  function() require("telescope.builtin").man_pages() end,                                                "n", unique = true, desc = "Telescope man pages" },
        { "<leader>fj",  function() require("telescope.builtin").jumplist() end,                                                 "n", unique = true, desc = "Telescope jumplist" },
        { "<leader>fc",  function() require("telescope.builtin").commands() end,                                                 "n", unique = true, desc = "Telescope commands" },
        { "<leader>gw",  function() require('telescope').extensions.git_worktree.git_worktrees() end,                            "n", unique = true, desc = "Telescope Git worktrees" },
        { "<leader>gwc", function() require('telescope').extensions.git_worktree.create_git_worktree() end,                      "n", unique = true, desc = "Telescope create Git worktree" },
        { "<leader>fs",  function() require("telescope").extensions.luasnip.luasnip(require("telescope.themes").get_ivy()) end,  "n", unique = true, desc = "Telescope LuaSnip snippets" },
        { "<bs>r",       function() require("telescope.builtin").lsp_references(require("telescope.themes").get_ivy()) end,      "n", unique = true, desc = "Telescope LSP references" },
        { "<bs>vd",      function() require("telescope.builtin").diagnostics(require("telescope.themes").get_ivy()) end,         "n", unique = true, desc = "Telescope diagnostics" },
        { "<bs>d",       function() require("telescope.builtin").lsp_definitions(require("telescope.themes").get_ivy()) end,     "n", unique = true, desc = "Telescope LSP definitions" },
        { "<bs>i",       function() require("telescope.builtin").lsp_implementations(require("telescope.themes").get_ivy()) end, "n", unique = true, desc = "Telescope LSP implementations" },
        {
            "<bs>s",
            function()
                require("telescope.builtin").lsp_document_symbols(require("telescope.themes")
                    .get_ivy())
            end,
            "n",
            unique = true,
            desc = "Telescope LSP implementations"
        }
    },
    opts = {
        defaults = {
            results_title = false,
            prompt_tite = false,
            mappings = {
                n = {
                    ["<c-c>"] = "close",
                    ["<c-h>"] = "which_key",
                    ["<c-x>"] = require('telescope.actions').delete_buffer,
                    ["<C-s>"] = require('telescope.actions.layout').toggle_preview,
                    ["<C-y>"] = function()
                        local entry = require("telescope.actions.state").get_selected_entry()
                        local cb_opts = vim.opt.clipboard:get()
                        if vim.tbl_contains(cb_opts, "unnamed") then vim.fn.setreg("*", entry.path) end
                        if vim.tbl_contains(cb_opts, "unnamedplus") then
                            vim.fn.setreg("+", entry.path)
                        end
                        vim.fn.setreg("", entry.path)
                    end,
                },
                i = {
                    ["<c-h>"] = "which_key",
                    ["<c-x>"] = require('telescope.actions').delete_buffer,
                    ["<C-s>"] = require('telescope.actions.layout').toggle_preview,
                    ["<C-y>"] = function()
                        local entry = require("telescope.actions.state").get_selected_entry()
                        local cb_opts = vim.opt.clipboard:get()
                        if vim.tbl_contains(cb_opts, "unnamed") then vim.fn.setreg("*", entry.path) end
                        if vim.tbl_contains(cb_opts, "unnamedplus") then
                            vim.fn.setreg("+", entry.path)
                        end
                        vim.fn.setreg("", entry.path)
                    end,
                }
            },
            preview = {
                hide_on_startup = true
            },
        },
    },
}
