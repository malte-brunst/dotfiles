-- calling :ToggleLineNumbers toggles all line numbers on or off
local function toggle_number_opt()
    local current_number_opt = vim.opt.number:get()
    if current_number_opt then
        vim.opt.number = false
        vim.opt.relativenumber = false
    else
        vim.opt.number = true
        vim.opt.relativenumber = true
    end
end
vim.api.nvim_create_user_command("ToggleLineNumbers", toggle_number_opt, {})


-- calling :Shellcheck will run shellcheck on the current buffer and write the output to
-- a temporary unnamed buffer opened in a vertical split
local function shellcheck_actions()
    local path_to_temp_file = "/tmp/shellcheck_nvim"
    vim.cmd(":silent !shellcheck % > " .. path_to_temp_file)
    vim.cmd(":vsplit " .. path_to_temp_file)
end
vim.api.nvim_create_user_command("Shellcheck", shellcheck_actions, {})

-- calling :ReloadConfig will reload the complete neovim configuraiton files
local function reload_config()
    os.execute("setup nvim")
    for name, _ in pairs(package.loaded) do
        if name:match('^mbrunst') then
            package.loaded[name] = nil
        end
    end
    dofile(vim.env.MYVIMRC)
end
vim.api.nvim_create_user_command("ReloadConfig", reload_config, {})
