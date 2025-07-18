return {
'stevearc/oil.nvim',
    lazy = false,
    opts = {
        default_file_explorer = true,
        columns = {
            "icon",
            "permissions",
            "mtime",
        },
        view_options = {
            show_hidden = true
        },
    },
    constrain_cursor = "name",
    watch_for_changes = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        {"<leader>fe", "<cmd>Oil<cr>", "n", noremap = true ,unique = true, silent = true}
    }
}
