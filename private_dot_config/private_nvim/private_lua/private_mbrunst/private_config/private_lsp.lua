local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- PYTHON
require("lspconfig").basedpyright.setup { autostart = false, capabilities = capabilities, on_attach = require("lsp-format").on_attach }
require("lspconfig").ruff.setup { autostart = false, capabilities = capabilities, on_attach = require("lsp-format").on_attach }

-- BASH
require("lspconfig").bashls.setup { autostart = false, capabilities = capabilities, on_attach = require("lsp-format").on_attach }

-- LUA
require("lspconfig").lua_ls.setup {
    autostart = false,
    capabilities = capabilities,
    on_attach = require("lsp-format").on_attach,
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                    -- Depending on the usage, you might want to add additional paths here.
                    -- "${3rd}/luv/library"
                    -- "${3rd}/busted/library",
                }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                -- library = vim.api.nvim_get_runtime_file("", true)
            }
        })
    end,
    settings = {
        Lua = {}
    }
}
