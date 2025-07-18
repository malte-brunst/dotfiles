local set_global_keymap = vim.api.nvim_set_keymap
local options = { noremap = true, unique = true }
local silent_options = { noremap = true, unique = true, silent = true }

-- make jk or kj another escape key
set_global_keymap("i", "jk", "<esc>", silent_options)
set_global_keymap("i", "kj", "<esc>", silent_options)

-- set my global leader key to be <space>
set_global_keymap("n", "<space>", "<nop>", silent_options)
vim.g.mapleader = " "

-- save the buffer faster
set_global_keymap("n", "<leader>w", ":update<cr>", options)

-- remove search highlighting
set_global_keymap("n", "<leader>h", ":noh<cr>", silent_options)

-- switch to the alternative buffer
set_global_keymap("n", "<leader>j", "<c-^>", options)

-- set the working directory of the current tab to the current buffer's directory
set_global_keymap("n", "<leader>cwd", ":tcd %:p:h<cr>", options)

-- remap n and N such that the cursor does not bounce around on searches
set_global_keymap("n", "n", "nzz", options)
set_global_keymap("n", "N", "Nzz", options)

-- remap <c-d> and <c-u> such that the cursor does not bounce around
set_global_keymap("n", "<c-d>", "<c-d>zz", options)
set_global_keymap("n", "<c-u>", "<c-u>zz", options)

-- use the ESC key in terminal mode to exit terminal insert mode
set_global_keymap("t", "<esc>", [[<c-\><c-n>]], options)

-- open the quickfix list
set_global_keymap("n", "<leader>q", "<cmd>copen<cr>", options)
-- navigate the quickfix list
set_global_keymap("n", "<leader>cn", "<cmd>cnext<cr>", options)
set_global_keymap("n", "<leader>cN", "<cmd>cprevious<cr>", options)

-- open the location list
set_global_keymap("n", "<leader>l", "<cmd>lopen<cr>", options)
-- navigate the location list
set_global_keymap("n", "<leader>ln", "<cmd>lnext<cr>", options)
set_global_keymap("n", "<leader>lN", "<cmd>lprevious<cr>", options)


-- in insert mode, make an undo only undo all inserts until the last . , ! ? ;
set_global_keymap("i", ",", ",<c-g>u", silent_options)
set_global_keymap("i", ".", ".<c-g>u", silent_options)
set_global_keymap("i", "!", "!<c-g>u", silent_options)
set_global_keymap("i", "?", "?<c-g>u", silent_options)
set_global_keymap("i", ";", ";<c-g>u", silent_options)

-- remap jumping to tag for a german keyboard
set_global_keymap("n", "ü", "<c-]>", options)

-- in normal mode, make it easy to delete the file and buffer of the current buffer
set_global_keymap("n", "<leader>rm", "<cmd>call delete(expand('%')) | bdelete!<cr>", options)

