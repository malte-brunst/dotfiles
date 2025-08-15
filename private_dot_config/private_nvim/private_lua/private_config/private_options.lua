-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.api.nvim_set_hl(0, "LineNr", { fg = "green", bg = "black" })

local opt = vim.opt

if vim.fn.has("nvim-0.10") == 1 then
	opt.smoothscroll = false
end
