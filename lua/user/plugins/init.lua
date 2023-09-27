return {
	{
		"nvim-lua/plenary.nvim",
	},

	{
		"nvim-lua/popup.nvim",
	},

	{
		"rafamadriz/friendly-snippets",
	}, -- a bunch of snippets to use

	{ "L3MON4D3/LuaSnip" },

	-- LSP Start
	{ "hrsh7th/cmp-nvim-lsp" }, -- nvim-cmp source for neovim builtin LSP client

	{
		"b0o/schemastore.nvim",
	},
	{

		"williamboman/mason.nvim",
	},

	{
		{
			"williamboman/mason-lspconfig.nvim",
		},
		{
			"neovim/nvim-lspconfig",
			config = function()
				require("user.lsp")
			end,
		},
	},

	--[[ Rust Tools ]]
	{
		"simrat39/rust-tools.nvim",
		--[[ config = function() ]]
		--[[ 	require("cfg.rust-tools") ]]
		--[[ end, ]]
	},

	{
		"hrsh7th/nvim-cmp",
		--[[ config = function() ]]
		--[[ 	require("user.cmp") ]]
		--[[ end, ]]
	}, -- The completion plugin

	{
		"hrsh7th/cmp-cmdline",
	}, -- cmdline completions

	{ "saadparwaiz1/cmp_luasnip" }, -- snippet completions
	{ "hrsh7th/cmp-nvim-lua" }, -- nvim-cmp source for neovim Lua API.
	{ "hrsh7th/cmp-buffer" }, -- buffer completions
	{ "hrsh7th/cmp-path" }, -- path completions

	{
		"ray-x/lsp_signature.nvim",
	},

	{
		"nvimdev/lspsaga.nvim",
	},

	-- LSP End
	--

	-- null ls for formatting
	{ -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
		"jose-elias-alvarez/null-ls.nvim",
	},
	-- Autopairs
	{
		"windwp/nvim-autopairs",
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	--  nvim-ts-context-commentstring
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
	},

	{
		"windwp/nvim-ts-autotag",
	},

	-- UI
	-- use("eddyekofo94/gruvbox-flat.nvim") --colorscheme
	-- use("sainnhe/gruvbox-material") --colorscheme
	-- use("shaunsingh/nord.nvim") --colorscheme
	-- use("Everblush/everblush.nvim") --colorscheme
	-- use("shaunsingh/nord.nvim") --colorscheme
	--[[ use("shaunsingh/nord.nvim") ]]
	{ "catppuccin/nvim", name = "catppuccin" },

	{ -- lua `fork` of vim-web-devicons for neovim
		"kyazdani42/nvim-web-devicons",
	},

	-- Bufferline
	{
		"akinsho/bufferline.nvim",
	},

	-- LuaLine --
	{
		"nvim-lualine/lualine.nvim",
	},

	{
		"folke/trouble.nvim",
	},

	{
		"andreadev-it/Shade.nvim", -- fork of sunjon/Shade with disabled filetypes
		-- "sunjon/Shade.nvim",
		--	after = "lualine.nvim",
	},

	-- IndentLine
	{
		"lukas-reineke/indent-blankline.nvim",
		-- event = "BufRead",
		-- cmd = "IndentBlanklineToggle",
	},

	-- Nvim Colorizer
	{
		"NvChad/nvim-colorizer.lua",
		--		event = "BufRead",
	},

	-- Git Signs
	{
		"lewis6991/gitsigns.nvim",
	},

	-- Nvim Tree
	{
		"kyazdani42/nvim-tree.lua",
	},

	-- use({
	-- 	"simrat39/symbols-outline.nvim",
	-- 	after = "trouble.nvim",
	-- 	config = function()
	-- 		require("cfg.outline")
	-- 	end,
	-- })

	-----------------------------------------------------------------------------------------------------------
	-- UX

	{
		"antoinemadec/FixCursorHold.nvim",
	},

	--[[ use({ ]]
	--[[ 	"nathom/filetype.nvim", ]]
	--[[ 	config = function() ]]
	--[[ 		require("cfg.filetype") ]]
	--[[ 	end, ]]
	--[[ }) -- A faster version of filetype.vim ]]
	{ "lewis6991/impatient.nvim" },

	-- use({
	-- 	"karb94/neoscroll.nvim",
	-- 	event = "WinScrolled",
	-- 	config = function()
	-- 		require("cfg.neoscroll")
	-- 	end,
	-- })

	{
		"psliwka/vim-smoothie",
	},

	-- use({
	-- 	"declancm/cinnamon.nvim",
	-- 	event = "WinScrolled",
	-- 	config = function()
	-- 		require("cfg.cinnamon")
	-- 	end,
	-- })

	-- Keep window layout when buffer gets deleted
	{
		"famiu/bufdelete.nvim",
	},

	-- better escape, without delay
	{
		"max397574/better-escape.nvim",
	},

	--------------------------------------------------------------------------------------------------------------
	-- Misc
	-- Telescope --
	-- fzf sorter for telescope

	{ --Find, Filter, Preview, Pick. All lua, all the time.
		"nvim-telescope/telescope.nvim",
	},

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},

	{
		"jvgrootveld/telescope-zoxide",
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		build = "make",
	},
	{
		"nvim-telescope/telescope-project.nvim",
	},
	{
		"benfowler/telescope-luasnip.nvim",
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		dependencies = { "tami5/sqlite.lua" },
	},
	{
		"cljoly/telescope-repo.nvim",
	},

	-- Comments
	{
		"numToStr/Comment.nvim",
	},

	-- Terminal Integration
	{
		"akinsho/nvim-toggleterm.lua",
	},

	-- Tmux Integration--
	{
		"aserowy/tmux.nvim",
	},

	-- Run Commands in Tmux
	{
		"preservim/vimux",
		-- cmd = { "VimuxRunCommand", "VimuxRunLastCommand", "VimuxPromptCommand" },
	},

	-- Code Runner --
	{
		"CRAG666/code_runner.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},

	{
		"michaelb/sniprun",
		build = "bash ./install.sh",
	},

	-- Twilight and True Zen
	{ -- Truezen
		"Pocco81/TrueZen.nvim",
	},

	{ -- Twilight
		"folke/twilight.nvim",
	},

	-- vim-surround: Delete/change/add parentheses/quotes/XML-tags/much more with ease
	{ "tpope/vim-surround" },

	-- unimpaired.vim: Pairs of handy bracket mappings
	{ "tpope/vim-unimpaired" },

	{
		"tweekmonster/startuptime.vim",
		build = "StartupTime",
	},

	{
		"ggandor/lightspeed.nvim",
	},

	{
		"tamton-aquib/duck.nvim",
	},

	{
		"ThePrimeagen/harpoon",
	},

	-- use({
	-- 	"nvim-pack/nvim-spectre",
	-- 	event = "CursorHold",
	-- 	config = function()
	-- 		require("cfg.spectre")
	-- 	end,
	-- })
	--
	-- use({
	-- 	"mfussenegger/nvim-dap",
	-- 	after = "nvim-spectre",
	-- })
	--
	-- use({
	-- 	"mfussenegger/nvim-dap-python",
	-- 	after = "nvim-dap",
	-- })

	{
		"folke/lsp-colors.nvim",
	},

	--[[ use({ ]]
	--[[ 	"iamcco/markdown-preview.nvim", ]]
	--[[ 	run = function() ]]
	--[[ 		vim.fn["mkdp#util#install"]() ]]
	--[[ 	end, ]]
	--[[ 	event = "CursorHold", ]]
	--[[ }) ]]

	-- use({
	-- 	"glacambre/firenvim",
	-- 	event = "CursorHold",
	-- 	run = function()
	-- 		vim.fn["firenvim#install"](0)
	-- 	end,
	-- })

	{
		"folke/which-key.nvim",
	},

	{
		"turbio/bracey.vim",
	},
}
