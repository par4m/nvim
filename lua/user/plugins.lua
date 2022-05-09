local fn = vim.fn

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
	command = "source <afile> | PackerSync ",
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
return packer.startup(function(use)
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

	----------------------------------------------------------------------------------------------------------------

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lua") -- nvim-cmp source for neovim Lua API.

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP

	use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim builtin LSP client
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("b0o/schemastore.nvim") -- JSON schemas for Neovim
	-- use "folke/trouble.nvim"
	-- use "ray-x/navigator.lua"

	-- null ls for formatting
	use({ -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufRead", "BufNewFile" },
		cmd = "Format",
		after = "plenary.nvim",
		config = function()
			require("cfg.null-ls")
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

	-----------------------------------------------------------------------------------------------------------

	-- UI
	use("eddyekofo94/gruvbox-flat.nvim") --colorscheme
	-- use("sainnhe/gruvbox-material") --colorscheme
	-- use("gruvbox-community/gruvbox") --colorscheme

	-- use 'rrethy/vim-illuminate'  automatically highlighting other uses of the word under the cursor.

	use({ -- lua `fork` of vim-web-devicons for neovim
		"kyazdani42/nvim-web-devicons",
		after = "gruvbox-flat.nvim",
		event = "BufRead",
		config = function()
			require("cfg.icons")
		end,
	})

	-- Nvim Colorizer
	use({
		"norcalli/nvim-colorizer.lua",
		event = "BufRead",
		config = function()
			require("cfg.colorizer")
		end,
	})

	-- Git Signs
	use({
		"lewis6991/gitsigns.nvim",
		after = "plenary.nvim",
		config = function()
			require("cfg.gitsigns")
		end,
	})

	-- Nvim Tree
	use({
		"kyazdani42/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		config = function()
			require("cfg.nvim-tree")
		end,
	})

	-- Bufferline
	use({
		"akinsho/bufferline.nvim",
		after = "gruvbox-flat.nvim",
		config = function()
			require("cfg.bufferline")
		end,
	})

	-- Statusline --
	-- Feline --

	-- use({
	-- 	"feline-nvim/feline.nvim",
	-- 	after = "nvim-web-devicons",
	-- 	config = function()
	-- 		require("cfg.feline")
	-- 	end,
	-- })
	-- LuaLine --
	use({
		"nvim-lualine/lualine.nvim",
		after = "nvim-web-devicons",
		config = function()
			require("cfg.lualine")
		end,
	})

	--

	-- IndentLine
	use({
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		config = function()
			require("cfg.indent-blankline")
		end,
	})
	-----------------------------------------------------------------------------------------------------------

	-- UX
	use("antoinemadec/FixCursorHold.nvim")
	use("nathom/filetype.nvim") -- A faster version of filetype.vim
	use("lewis6991/impatient.nvim")

	use({
		"karb94/neoscroll.nvim",
		event = { "BufRead", "BufNewFile" },
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
	-- lua with packer.nvim
	use({
		"max397574/better-escape.nvim",
		event = "BufRead",
		config = function()
			require("cfg.better-escape")
		end,
	})
	--------------------------------------------------------------------------------------------------------------
	-- Misc
	-- Telescope --
	use({ --Find, Filter, Preview, Pick. All lua, all the time.
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		-- module = "telescope",
		module_pattern = "telescope.*",
		config = function()
			require("cfg.telescope")
		end,
	})

	-- fzf sorter for telescope
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		requires = { "nvim-telescope/telescope.nvim" },
		after = "telescope.nvim",
		run = "make",
	})

	use({
		"jvgrootveld/telescope-zoxide",
		requires = { "nvim-telescope/telescope.nvim" },
		after = "telescope.nvim",
	})

	use({
		"benfowler/telescope-luasnip.nvim",
		requires = { "nvim-telescope/telescope.nvim", after = "telescope.nvim" },
	})

	-- Autopairs
	use({
		"windwp/nvim-autopairs",
		after = "nvim-cmp",
		event = { "BufRead", "BufNewFile" },
		config = function()
			require("cfg.autopairs")
		end,
	})

	-- Comments
	use({
		"numToStr/Comment.nvim",
		module = "Comment",
		keys = { "gcc", "gc" },
		config = function()
			require("cfg.comment")
		end,
	})

	--  nvim-ts-context-commentstring
	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
		after = "nvim-treesitter",
	})

	-- Terminal Integration
	use({
		"akinsho/nvim-toggleterm.lua",
		event = { "BufRead", "BufNewFile" },
		config = function()
			require("cfg.toggleterm")
		end,
	})

	-- Tmux Integration--
	use({
		"aserowy/tmux.nvim",
		event = { "BufRead", "BufNewFile" },
		config = function()
			require("cfg.tmux")
		end,
	})

	-- Run Commands in Tmux
	use({
		"preservim/vimux",
		cmd = { "VimuxRunCommand", "VimuxRunLastCommand", "VimuxPromptCommand" },
	})

	-- Code Runner --
	use({
		"CRAG666/code_runner.nvim",
		requires = "nvim-lua/plenary.nvim",
		event = { "BufRead", "BufNewFile" },
		cmd = { "RunCode" },
		config = function()
			require("cfg.code-runner")
		end,
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

	use({ "tpope/vim-surround", event = "BufRead" })

	-- unimpaired.vim: Pairs of handy bracket mappings
	use({ "tpope/vim-unimpaired", event = "BufRead" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
