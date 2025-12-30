-- - @type number
-- local function get_float_width()
--     return math.floor(vim.api.nvim_win_get_width(0) * 0.3)
-- end

-- - @type number
local function get_float_height()
    return math.floor(vim.api.nvim_win_get_height(0) * 0.8)
end

-- - @type number
local function get_row()
    return math.floor((vim.api.nvim_win_get_height(0) - get_float_height()) / 2)
end

-- - @type number
local function get_col()
    return 3 -- shift 3 units from left side
end

require("nvim-tree").setup ({
    view = {
        -- side = "right",
       float = {
           enable = true,
           quit_on_focus_loss = true,
           open_win_config = {
               border = 'rounded',
               relative = 'editor',
               anchor = 'NE',
               title = {{" File Explorer ", "TitleHighlight"}},
               title_pos = "center",
               -- width = get_float_width(),
               width = 40,
               height = get_float_height(),
               row = get_row(),
               col = get_col(),
           }
       },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})
