-- EDITING
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.hidden = true
vim.opt.formatoptions = "tcqnl1j"
vim.opt.diffopt:append("vertical")

-- DISPLAY
vim.opt.scrolloff = 5
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.listchars = "trail:~,nbsp:#,tab:»·"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"
vim.opt.wrap = false
vim.opt.completeopt = "menuone,preview"
vim.opt.shortmess:append("c")
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.cmdwinheight = 15

-- KEYMAPPINGS
local set_global_keymap = vim.api.nvim_set_keymap
local options = { noremap = true, unique = true }
local silent_options = { noremap = true, unique = true, silent = true }

-- set my global leader key to be <space>
set_global_keymap("n", "<space>", "<nop>", silent_options)
vim.g.mapleader = " "

-- save the buffer faster s
set_global_keymap("n", "<leader>w", ":update<cr>", options)

-- remove search highlighting
set_global_keymap("n", "<leader>h", ":noh<cr>", silent_options)

-- switch to the alternative buffer
set_global_keymap("n", "<leader>j", "<c-^>", options)

-- remap n and N such that the cursor does not bounce around on searches
set_global_keymap("n", "n", "nzz", options)
set_global_keymap("n", "N", "Nzz", options)

-- remap <c-d> and <c-u> such that the cursor does not bounce around
set_global_keymap("n", "<c-d>", "<c-d>zz", options)
set_global_keymap("n", "<c-u>", "<c-u>zz", options)

-- in insert mode, make an undo only undo all inserts until the last . , ! ? ;
set_global_keymap("i", ",", ",<c-g>u", silent_options)
set_global_keymap("i", ".", ".<c-g>u", silent_options)
set_global_keymap("i", "!", "!<c-g>u", silent_options)
set_global_keymap("i", "?", "?<c-g>u", silent_options)
set_global_keymap("i", ";", ";<c-g>u", silent_options)
