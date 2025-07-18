require("true-zen").setup({
    modes = {                        -- configurations per mode
        ataraxis = {
            shade = "dark",          -- if `dark` then dim the padding windows, otherwise if it's `light` it'll brighten said windows
            backdrop = 20,           -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
            minimum_writing_area = { -- minimum size of main window
                width = 90,
                height = 60,
            },
            quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
            padding = {            -- padding windows
                left = 52,
                right = 52,
                top = 0,
                bottom = 0,
            },
        },
    }
})
