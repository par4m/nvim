local fn = vim.fn
local util = require("packer.util")
-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	-- vim.cmd [[packadd packer.nvim]]
	require("packer").packadd = "packer.nvim"
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
--vim.cmd [[
--  augroup packer_user_config
--   autocmd!
--  autocmd BufWritePost plugins.lua source <afile> | PackerSync
-- augroup end
-- ]]

local group = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "source <afile> | PackerCompile profile=true ",
	pattern = "plugins.lua",
	group = group,
})

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
-- packer.init {
-- display = {
-- open_fn = function()
-- return require("packer.util").float { border = "rounded" }
-- end, }, }

-- Install your plugins here
return packer.startup({
	function(use)
		-- My plugins here
		--

		-- Package Manager
		use("wbthomason/packer.nvim") -- Have packer manage itself
		use({
			"nvim-lua/plenary.nvim",
			event = "BufRead",
		})

		use({
			"nvim-lua/popup.nvim",
			after = "plenary.nvim",
		})

		use({
			"rafamadriz/friendly-snippets",
			event = "CursorHold",
		}) -- a bunch of snippets to use

		use({ "L3MON4D3/LuaSnip", wants = "friendly-snippets", after = "friendly-snippets" })

		-- LSP Start
		use({ "hrsh7th/cmp-nvim-lsp", after = "LuaSnip" }) -- nvim-cmp source for neovim builtin LSP client

		use({
			"b0o/schemastore.nvim",
			after = "cmp-nvim-lsp",
		})

		use({
			{
				"williamboman/nvim-lsp-installer",
				after = "schemastore.nvim",
			},
			{
				"neovim/nvim-lspconfig",
				config = function()
					require("user.lsp")
				end,
				after = "nvim-lsp-installer",
			},
		})

		use({
			"hrsh7th/cmp-cmdline",
			after = "nvim-lspconfig",
		}) -- cmdline completions

		use({
			"hrsh7th/nvim-cmp",
			after = "cmp-cmdline",
			config = function()
				require("user.cmp")
			end,
		}) -- The completion plugin

		use({ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" }) -- snippet completions
		use({ "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" }) -- nvim-cmp source for neovim Lua API.
		use({ "hrsh7th/cmp-buffer", after = "cmp-nvim-lua" }) -- buffer completions
		use({ "hrsh7th/cmp-path", after = "cmp-buffer" }) -- path completions

		use({
			"ray-x/lsp_signature.nvim",
			after = "cmp-path",
			config = function()
				require("cfg.signature")
			end,
		})

		use({
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			after = "lsp_signature.nvim",
			config = function()
				require("cfg.trouble")
			end,
		})

		use({
			"tami5/lspsaga.nvim",
			after = "trouble.nvim",
			config = function()
				require("cfg.saga")
			end,
		})

		-- LSP End
		--

		-- null ls for formatting
		use({ -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
			"jose-elias-alvarez/null-ls.nvim",
			after = "trouble.nvim",
			config = function()
				require("cfg.null-ls")
			end,
		})
		-- Autopairs
		use({
			"windwp/nvim-autopairs",
			after = "null-ls.nvim",
			config = function()
				require("cfg.autopairs")
			end,
		})

		-- treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			event = { "BufRead", "BufNewFile" },
			config = function()
				require("cfg.treesitter")
			end,
			run = ":TSUpdate",
		})

		--  nvim-ts-context-commentstring
		use({
			"JoosepAlviste/nvim-ts-context-commentstring",
			after = "nvim-treesitter",
		})

		use({
			"windwp/nvim-ts-autotag",
			after = "nvim-treesitter",
		})

		-- UI
		use("eddyekofo94/gruvbox-flat.nvim") --colorscheme

		use({ -- lua `fork` of vim-web-devicons for neovim
			"kyazdani42/nvim-web-devicons",
			event = "BufRead",
			after = "gruvbox-flat.nvim",
			config = function()
				require("cfg.icons")
			end,
		})

		-- Bufferline
		use({
			"akinsho/bufferline.nvim",
			after = "nvim-web-devicons",
			config = function()
				require("cfg.bufferline")
			end,
		})

		-- LuaLine --
		use({
			"nvim-lualine/lualine.nvim",
			after = "bufferline.nvim",
			config = function()
				require("cfg.lualine")
			end,
		})

		use({
			"andreadev-it/Shade.nvim", -- fork of sunjon/Shade with disabled filetypes
			-- "sunjon/Shade.nvim",
			event = "WinLeave",
			--	after = "lualine.nvim",
			config = function()
				require("cfg.shade")
			end,
		})

		-- IndentLine
		use({
			"lukas-reineke/indent-blankline.nvim",
			-- event = "BufRead",
			event = "CursorHold",
			config = function()
				require("cfg.indent-blankline")
			end,
		})

		-- Nvim Colorizer
		use({
			"norcalli/nvim-colorizer.lua",
			--		event = "BufRead",
			after = "indent-blankline.nvim",
			config = function()
				require("cfg.colorizer")
			end,
		})

		-- Git Signs
		use({
			"lewis6991/gitsigns.nvim",
			after = "nvim-colorizer.lua",
			config = function()
				require("cfg.gitsigns")
			end,
		})

		-- Nvim Tree
		use({
			"kyazdani42/nvim-tree.lua",
			after = "gitsigns.nvim",
			--	cmd = { "NvimTreeToggle", "NvimTreeFocus" },
			config = function()
				require("cfg.nvim-tree")
			end,
		})

		use({
			"simrat39/symbols-outline.nvim",
			after = "trouble.nvim",
			config = function()
				require("cfg.outline")
			end,
		})

		-----------------------------------------------------------------------------------------------------------
		-- UX

		use({
			"antoinemadec/FixCursorHold.nvim",
			after = "nvim-lspconfig",
		})
		use("nathom/filetype.nvim") -- A faster version of filetype.vim
		use("lewis6991/impatient.nvim")

		use({
			"karb94/neoscroll.nvim",
			event = "WinScrolled",
			config = function()
				require("cfg.neoscroll")
			end,
		})

		-- Keep window layout when buffer gets deleted
		use({
			"famiu/bufdelete.nvim",
			cmd = { "Bdelete" },
		})

		-- better escape, without delay
		use({
			"max397574/better-escape.nvim",
			after = "nvim-tree.lua",
			--		event = "InsertCharPre",
			config = function()
				require("cfg.better-escape")
			end,
		})

		--------------------------------------------------------------------------------------------------------------
		-- Misc
		-- Telescope --
		-- fzf sorter for telescope

		use({ --Find, Filter, Preview, Pick. All lua, all the time.
			"nvim-telescope/telescope.nvim",
			event = "CursorHold",
			--		cmd = "Telescope",
			--		module_pattern = "telescope.*",
			config = function()
				require("cfg.telescope")
			end,
		})

		use({
			"nvim-telescope/telescope-fzf-native.nvim",
			after = "telescope.nvim",
			config = function()
				require("telescope").load_extension("fzf")
			end,
			run = "make",
		})

		use({
			"jvgrootveld/telescope-zoxide",
			after = "telescope.nvim",
			config = function()
				require("telescope").load_extension("zoxide")
			end,

			-- requires = { "nvim-telescope/telescope.nvim" },
		})
		use({
			"nvim-telescope/telescope-file-browser.nvim",
			after = "telescope.nvim",
			config = function()
				require("telescope").load_extension("file_browser")
			end,
			-- requires = { "nvim-telescope/telescope.nvim" },
			run = "make",
		})
		use({
			"nvim-telescope/telescope-project.nvim",
			config = function()
				require("telescope").load_extension("project")
			end,

			after = "telescope.nvim",
		})
		use({
			"benfowler/telescope-luasnip.nvim",
			after = "telescope.nvim",
			config = function()
				require("telescope").load_extension("luasnip")
			end,
			-- requires = { "nvim-telescope/telescope.nvim" },
		})
		use({
			"nvim-telescope/telescope-frecency.nvim",
			after = "telescope.nvim",
			requires = { "tami5/sqlite.lua" },
			config = function()
				require("telescope").load_extension("frecency")
			end,
		})
		use({
			"cljoly/telescope-repo.nvim",
			after = "telescope.nvim",
			config = function()
				require("telescope").load_extension("repo")
			end,
		})

		-- Comments
		use({
			"numToStr/Comment.nvim",
			event = "CursorHold",
			--		module = "Comment",
			--		keys = { "gcc", "gc", "gb" },
			config = function()
				require("cfg.comment")
			end,
		})

		-- Terminal Integration
		use({
			"akinsho/nvim-toggleterm.lua",
			event = "CursorHold",
			--			cmd = "ToggleTerm",
			config = function()
				require("cfg.toggleterm")
			end,
		})

		-- Tmux Integration--
		use({
			"aserowy/tmux.nvim",
			event = "CursorHold",
			config = function()
				require("cfg.tmux")
			end,
		})

		-- Run Commands in Tmux
		use({
			"preservim/vimux",
			event = "CursorHold",
			-- cmd = { "VimuxRunCommand", "VimuxRunLastCommand", "VimuxPromptCommand" },
		})

		-- Code Runner --
		use({
			"CRAG666/code_runner.nvim",
			requires = "nvim-lua/plenary.nvim",
			event = "CursorHold",
			-- cmd = { "RunCode", "RunFile", "RunProject", "RunClose" },
			--	module_pattern = "Run*",
			config = function()
				require("cfg.code-runner")
			end,
		})

		use({
			"michaelb/sniprun",
			after = "code_runner.nvim",
			config = function()
				require("cfg.sniprun")
			end,
			run = "bash ./install.sh",
		})

		-- Twilight and True Zen
		use({ -- Truezen
			"Pocco81/TrueZen.nvim",
			cmd = {
				"TZAtaraxis",
				"TZMinimalist",
				"TZFocus",
			},
			config = function()
				require("cfg.truezen")
			end,
		})

		use({ -- Twilight
			"folke/twilight.nvim",
			cmd = {
				"Twilight",
				"TwilightEnable",
				"TwilightDisable",
			},
			config = function()
				require("cfg.twilight")
			end,
		})

		-- vim-surround: Delete/change/add parentheses/quotes/XML-tags/much more with ease
		use({ "tpope/vim-surround", event = "CursorHold" })

		-- unimpaired.vim: Pairs of handy bracket mappings
		use({ "tpope/vim-unimpaired", event = "CursorHold" })

		use({
			"tweekmonster/startuptime.vim",
			cmd = "StartupTime",
		})

		use({
			"ggandor/lightspeed.nvim",
			keys = { "s", "S", "f", "F", "t", "T" },
		})

		use({
			"tamton-aquib/duck.nvim",
			event = "CursorHold",
		})

		use({
			"ThePrimeagen/harpoon",
			event = "CursorHold",
			config = function()
				require("cfg.harpoon")
			end,
		})

		use({
			"nvim-pack/nvim-spectre",
			event = "CursorHold",
			config = function()
				require("cfg.spectre")
			end,
		})

		use({
			"mfussenegger/nvim-dap",
			after = "nvim-spectre",
		})

		use({
			"mfussenegger/nvim-dap-python",
			after = "nvim-dap",
		})

		use({
			"folke/lsp-colors.nvim",
			after = "nvim-dap",
		})

		use({
			"folke/which-key.nvim",
			event = "CursorHold",
			config = function()
				require("cfg.whichkey")
			end,
		})
	end,
	config = {
		snapshot_path = util.join_paths(fn.stdpath("config"), "snapshots"),
	},
})
