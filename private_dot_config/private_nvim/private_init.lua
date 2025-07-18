-- COLORS
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- EDITING
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.path:append("**")
vim.opt.hidden = true
vim.opt.textwidth = 88
vim.opt.colorcolumn = "88"
vim.opt.formatoptions = "tcqnl1j"
vim.opt.diffopt:append("vertical")

-- DISPLAY
vim.opt.scrolloff = 5
vim.opt.updatetime = 750
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.listchars = "trail:~,nbsp:#,tab:»·"
vim.opt.hlsearch = false
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
require("mbrunst.config.keymappings")

-- AUTOCOMMANDS
require("mbrunst.config.autocommands")

-- COMMANDS
require("mbrunst.config.commands")


-- BUILT-IN LSP
-- set_global_keymap("n", "<bs>h", "<cmd>lua vim.lsp.buf.hover()<cr>", options)
--set_global_keymap("i", "<c-h>h", "<cmd>lua vim.lsp.buf.hover()<cr>", options)
--set_global_keymap("n", "<bs>s", "<cmd>lua vim.lsp.buf.signature_help()<cr>", options)
--set_global_keymap("i", "<c-s>s", "<cmd>lua vim.lsp.buf.signature_help()<cr>", options)
--set_global_keymap("n", "<bs>f", "<cmd>lua vim.lsp.buf.formatting()<cr>", options)
--set_global_keymap("n", "<bs>n", "<cmd>lua vim.lsp.buf.rename()<cr>", options)
--set_global_keymap("n", "<bs>aw", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", options)
--set_global_keymap("n", "<bs>rw", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", options)
--set_global_keymap("n", "<bs>lw", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", options)

-- LUASNIP
-- luasnip
-- local luasnip = require("luasnip")
-- function luasnip_expand_or_forward_jumpable ()
--     if luasnip.expand_or_jumpable() then
--         luasnip.expand_or_jump()
--     end
-- end
-- function luasnip_backward_jumpable ()
--     if luasnip.jumpable(-1) then
--         luasnip.jump(-1)
--     end
-- end
-- function luasnip_next_choice (direction)
--     if luasnip.choice_active() then
--         luasnip.change_choice(direction)
--     end
-- end

-- set_global_keymap("i", "<c-f>", "<cmd>lua luasnip_expand_or_forward_jumpable()<cr>", options)
-- set_global_keymap("s", "<c-f>", "<cmd>lua luasnip_expand_or_forward_jumpable()<cr>", options)
-- set_global_keymap("i", "<c-d>", "<cmd>lua luasnip_backward_jumpable()<cr>", options)
-- set_global_keymap("s", "<c-d>", "<cmd>lua luasnip_backward_jumpable()<cr>", options)
-- set_global_keymap("i", "<c-v>", "<cmd>lua luasnip_next_choice(1)<cr>", options)
-- set_global_keymap("i", "<c-c>", "<cmd>lua luasnip_next_choice(-1)<cr>", options)

-- PLUGINS
require("mbrunst.config.lazy")

-- LSP
require("mbrunst.config.lsp")
