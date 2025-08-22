return {
	"folke/snacks.nvim",
	opts = {
		scroll = { enabled = false },
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
