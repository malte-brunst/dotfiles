-- KEYMAPPINGS
local set_global_keymap = vim.api.nvim_set_keymap
local options = { noremap = true, unique = true }
local silent_options = { noremap = true, unique = true, silent = true }

set_global_keymap("n", "<leader>g", ":Git<space>", options)
