-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set_global_keymap = vim.api.nvim_set_keymap
local options = { noremap = true, unique = true }
local silent_options = { noremap = true, unique = true, silent = true }

-- make jk or kj another escape key
set_global_keymap("i", "jk", "<esc>", silent_options)
set_global_keymap("i", "kj", "<esc>", silent_options)

-- remove search highlighting
set_global_keymap("n", "<leader>h", ":noh<cr>", silent_options)

-- switch to the alternative buffer
set_global_keymap("n", "<leader>j", "<c-^>", options)

-- remap <c-d> and <c-u> such that the cursor does not bounce around
set_global_keymap("n", "<c-d>", "<c-d>zz", options)
set_global_keymap("n", "<c-u>", "<c-u>zz", options)

-- use the ESC key in terminal mode to exit terminal insert mode
set_global_keymap("t", "<esc>", [[<c-\><c-n>]], options)

-- remap jumping to tag for a german keyboard
set_global_keymap("n", "ü", "<c-]>", options)
