return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          layout = { layout = { position = "right" } },
        },
        notifications = {
          win = { preview = { wo = { wrap = true } } },
        },
      },
    },
  },
}
