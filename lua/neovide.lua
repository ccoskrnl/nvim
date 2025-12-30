if vim.g.neovide then

    -- vim.o.guifont = "CaskaydiaCove Nerd Font:h14:b"
    vim.o.guifont = "CaskaydiaCove Nerd Font:h13:b"
    vim.g.neovide_scale_factor = 1.0
    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0

    -- Helper function for transparency formatting
    local alpha = function()
      return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
    end
    -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
    -- Setting g:neovide_transparency to a value between 0.0 and 1.0 will 
    -- set the opacity of the window to that value.
    vim.g.neovide_transparency = 0.8
    vim.g.transparency = 0.8
    vim.g.neovide_background_color = "#0f1117" .. alpha()
    -- vim.g.neovide_background_image = "/home/cc/Pictures/94323119_p0.jpg"
    --
    vim.g.neovide_window_blurred = true
    -- vim.g.neovide_floating_blur_amount_x = 2.0
    -- vim.g.neovide_floating_blur_amount_y = 2.0


    -- Theme
    vim.g.neovide_theme = 'auto'

    -- Remember Previous Windows Size
    vim.g.neovide_remember_windows_size = true

    -- Animate switch to command line
    vim.g.neovide_cursor_animate_command_line = true
    vim.g.neovide_floating_blur_amount_x = 2.0
    vim.g.neovide_floating_blur_amount_y = 2.0
    vim.g.neovide_position_animation_length = 0.15

    -- Sets how long the scroll animation takes to complete, measured in seconds. 
    -- Note that the timing is not completely accurate and might depend slightly 
    -- on have far you scroll, so experimenting is encouraged in order to tune it to your liking.
    vim.g.neovide_scroll_animation_length = 0.3

    -- Setting g:neovide_cursor_animation_length determines the time it takes for 
    -- the cursor to complete it's animation in seconds. Set to 0 to disable.
    vim.g.neovide_cursor_animation_length = 0.13

    vim.g.neovide_fullscreen = false

end
