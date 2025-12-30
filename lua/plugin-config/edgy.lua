require("edgy").setup ({
    options = {
        -- size = 40,  -- Width of the window
        left = { size = 40 },
        bottom = { size = 10 },
        right = { size = 30 },
        top = { size = 10 },
    },
    -- edgebar animations
    animate = {
        enabled = true,
        fps = 100, -- frames per second
        cps = 120, -- cells per second
        on_begin = function()
            vim.g.minianimate_disable = true
        end,
        on_end = function()
            vim.g.minianimate_disable = false
        end,
        -- Spinner for pinned views that are loading.
        -- if you have noice.nvim installed, you can use any spinner from it, like:
        -- spinner = require("noice.util.spinners").spinners.circleFull,
        spinner = {
            frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
            interval = 80,
        },
    },
    left = {
        {
            title = function()
              local buf_name = vim.api.nvim_buf_get_name(0) or "[No Name]"
              return vim.fn.fnamemodify(buf_name, ":t")
            end,
            ft = 'Outline',  -- Filetype for symbols-outline
            size = { height = 1 },
            pinned = true,  -- Keep the window always visible
            open = 'SymbolsOutline',  -- Command to open symbols-outline     
        }
    }
})

-- Additional Neovim configuration
vim.opt.splitkeep = 'screen'
vim.opt.laststatus = 3
