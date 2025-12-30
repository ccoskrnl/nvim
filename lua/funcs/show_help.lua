function ShowMyNvimHelp()
    local content = {
        'BarBar:',
        '`<A-,>`            to move to previous bar.',
        '`<A-.>`            to move to next bar.',
        '`<A-<>`            to re-order to previous bar.',
        '`<A->>`            to re-order to next bar.',
        '`<A-p>`            to pin current bar.',
        '`<A-c>`            to close current bar.',
        '',
        'File Explorer:',
        '`leader+t`         to open File Explorer.',
        '`g?`               to show NvimTree mappings in File Explorer.',
        '',
        'Telescope:',
        '`leader+ff`        to find files.',
        '`leader+fb`        to open file browser.',
        '`leader+fg`        to search strings.',
        '`leader+bf`        to open buffers.',
        '`leader+hf`        to open help tags.',
        '`leader+of`        to show old files.',
        '`leader+cs`        to switch colorscheme.',
        '`leader+rr`        to open registers.',
        '',
        'Joshuto:',
        '`leader+jo`        to open joshuto.',
        '',
        'SymbolsOutline:',
        '`leader+s`         to show symbols.',
        '`leader+S`         to close symbols.',
        '',
        'Console:',
        '`leader+cf`        to open a floating console.',
        '`leader+cb`        to open a console below main window.',
        '',
        'NeoComposer:',
        '`leader+qe`        to edit macros.',
        '`leader+qc`        to clear NeoComposer.',
        '   Q               Plays queued macro.',
        '   cq              Halts macro playback.',
        '   <A-q>           Toggles popup macro menu.',
        '   <c-n>           Cycles available macros forward.',
        '   <c-p>           Cycles available macros backward.',
        '   q               Starts recording, press again to end recording.',
        '   yq              Yank the currently selected macro, in human readable',
        '                   format into the default register.',
        '',
        'Marks:',
        '   mx              Set mark x',
        '   m,              Set the next available alphabetical (lowercase) mark',
        '   m;              Toggle the next available mark at the current line',
        '   dmx             Delete mark x',
        '   dm-             Delete all marks on the current line',
        '   dm<space>       Delete all marks in the current buffer',
        '   m]              Move to next mark',
        '   m[              Move to previous mark',
        '   m:              Preview mark. This will prompt you for a specific mark to',
        '                   preview; press <cr> to preview the next mark.',
        '                   ',
        '   m[0-9]          Add a bookmark from bookmark group[0-9].',
        '   dm[0-9]         Delete all bookmarks from bookmark group[0-9].',
        '   m}              Move to the next bookmark having the same type as the bookmark under',
        '                   the cursor. Works across buffers.',
        '   m{              Move to the previous bookmark having the same type as the bookmark under',
        '                   the cursor. Works across buffers.',
        '   dm=             Delete the bookmark under the cursor.',
    }

    local buf = vim.api.nvim_create_buf(false, true)

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)

    local win_opts = {
        relative = 'editor',
        anchor = 'NE', -- (main window)northeast
        width = 100,
        height = #content,
        col = math.floor((vim.api.nvim_win_get_width(0) + 100)/ 2),
        row = math.floor((vim.api.nvim_win_get_height(0) - #content) / 2),
        border = 'rounded',
        title = " Help ",
        title_pos = "center",
    }

    vim.api.nvim_open_win(buf, true, win_opts)

    vim.api.nvim_buf_set_keymap(buf, 'n', 'q', '<cmd>bd!<CR>', { noremap = true, silent = true})

end
