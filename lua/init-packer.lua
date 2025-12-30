local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-- LSP
	use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets plugin

	-- Code Snippets Syntax
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

	-- Web Development
	-- HTML Snippets
	use 'windwp/nvim-ts-autotag'
	-- HTML preview
	use({
		'ray-x/web-tools.nvim',
		config = function ()
			require('nvim-ts-autotag').setup()
		end
	})

	-- CSS color preview
	use({
		"roobert/tailwindcss-colorizer-cmp.nvim",
		-- optionally, override the default options:
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
		end
	})


	-- Java
	use 'mfussenegger/nvim-jdtls'


	-- Markdown
	-- install without yarn or npm
	-- use({
	-- 	"iamcco/markdown-preview.nvim",
	-- 	run = function() vim.fn["mkdp#util#install"]() end,
	-- })
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })


	-- AutoComment
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	-- Telescope
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use {
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	}

	-- Edgy
	use "folke/edgy.nvim"

	-- terminal
	use 'voldikss/vim-floaterm'

	-- Icon
	use 'kyazdani42/nvim-web-devicons'
	use 'theniceboy/joshuto.nvim'

	-- File Explorer
	use 'nvim-tree/nvim-tree.lua'

	-- Tab Page
	use 'romgrk/barbar.nvim'

	use {
		'ur4ltz/surround.nvim',
		config = function()
			require"surround".setup {mappings_style = "surround"}
		end
	}

	-- Symbol-Tree
	-- use 'simrat39/symbols-outline.nvim'
    use {
        'oskarrrrrrr/symbols.nvim',
        config = function()
            local r = require("symbols.recipes")
            require("symbols").setup(
                r.DefaultFilters,
                r.AsciiSymbols,
                {
                    sidebar = {
                        -- custom settings here
                        -- e.g. hide_cursor = false
                    }
                }
            )
        end
    }
	-- StatusLine
	use 'nvim-lualine/lualine.nvim'
	-- Enhanced Macro
	use {
		"ecthelionvi/NeoComposer.nvim",
		requires = { "kkharji/sqlite.lua" }
	}
	-- indent
	use "lukas-reineke/indent-blankline.nvim"
	-- git integration
	use 'lewis6991/gitsigns.nvim'
	-- which-key
	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

	-- Marks
	use "chentoast/marks.nvim"

	-- Better Comment
	use ({
		"Djancyp/better-comments.nvim",
		config = function ()
			require('better-comment').Setup({})
		end})

		-- Neovim Noice 
		use "MunifTanjim/nui.nvim"
		use "rcarriga/nvim-notify"
		use({
			"folke/noice.nvim",
			config = function()
				require("noice").setup({
					-- add any options here
				})
			end,
			requires = {
				-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
				"MunifTanjim/nui.nvim",
				-- OPTIONAL:
				--   `nvim-notify` is only needed, if you want to use the notification view.
				--   If not available, we use `mini` as the fallback
				"rcarriga/nvim-notify",
			}
		})
		use {
			'johmsalas/text-case.nvim',
			config = function()
				require('textcase').setup {}
				vim.api.nvim_set_keymap('n', 'gau', ":lua require('textcase').current_word('to_upper_case')<CR>", { noremap = true, silent = true })
				vim.api.nvim_set_keymap('v', 'gau', ":lua require('textcase').operator('to_upper_case')<CR>", { noremap = true, silent = true })
			end
		}

		-- Debug
		-- use { "nvim-neotest/nvim-nio" }
		-- use {"Pocco81/DAPInstall.nvim", branch = 'dev'}
		-- use {"pocco81/dap-buddy", branch = 'dev'}
		-- use 'mfussenegger/nvim-dap'
		-- use 'theHamsta/nvim-dap-virtual-text'
		-- use "rcarriga/nvim-dap-ui"
		-- use 'nvim-telescope/telescope-dap.nvim'
		-- use 'folke/neodev.nvim'
		-- use 'mfussenegger/nvim-dap-python'

		-- Start 
		use "startup-nvim/startup.nvim"
		-- colorscheme
		use 'rktjmp/lush.nvim'
		use {
			'uloco/bluloco.nvim',
			require = { 'rktjmp/lush.nvim' }
		}
		use 'folke/tokyonight.nvim'
		use 'NTBBloodbath/doom-one.nvim'
		use 'lukas-reineke/headlines.nvim'
		use 'nyoom-engineering/oxocarbon.nvim'
		use 'shaunsingh/nord.nvim'
		use { "catppuccin/nvim", as = "catppuccin" }


		use {
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- Library paths can be absolute
					"~/projects/my-awesome-lib",
					-- Or relative, which means they will be resolved from the plugin dir.
					"lazy.nvim",
					-- It can also be a table with trigger words / mods
					-- Only load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					-- always load the LazyVim library
					"LazyVim",
					-- Only load the lazyvim library when the `LazyVim` global is found
					{ path = "LazyVim", words = { "LazyVim" } },
					-- Load the wezterm types when the `wezterm` module is required
					-- Needs `justinsgithub/wezterm-types` to be installed
					{ path = "wezterm-types", mods = { "wezterm" } },
					-- Load the xmake types when opening file named `xmake.lua`
					-- Needs `LelouchHe/xmake-luals-addon` to be installed
					{ path = "xmake-luals-addon/library", files = { "xmake.lua" } },
				},
				-- always enable unless `vim.g.lazydev_enabled = false`
				-- This is the default
				enabled = function(root_dir)
					return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
				end,
				-- disable when a .luarc.json file is found
				enabled = function(root_dir)
					return not vim.uv.fs_stat(root_dir .. "/.luarc.json")
				end,
			},
		}

		if packer_bootstrap then
			require('packer').sync()
		end
	end)

