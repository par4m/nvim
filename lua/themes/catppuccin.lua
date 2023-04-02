require("catppuccin").setup({
	flavour = "frappe", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = false,
	show_end_of_buffer = false, -- show the '~' characters after the end of buffers
	term_colors = true,
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {
		all = {
			--[[ base = "#2e3440", ]]
			--[[ mantle = "#2e3440", ]]
			--[[ crust = "#2e3440", ]]
			base = "#1e1e2e",
			mantle = "#1e1e2e",
			crust = "#1e1e2e",
		},
	},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		notify = false,
		mini = false,
		treesitter = true,
		lightspeed = true,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")
vim.cmd("highlight NvimTreeStatusLineNC guibg=nvim_treebg guifg=nvim_treebg")
vim.cmd("highlight StatusLine guibg=nvim_treebg")
vim.cmd("highlight VertSplit guifg=#3B4252")
--[[ vim.cmd("highlight NvimTreeWinSeparator guifg=#2E3440")  ]]
vim.cmd("highlight NvimTreeWinSeparator guifg=#1e1e2e")
--[[ vim.cmd("highlight lualine_c_normal guifg=#2E3440") ]]
vim.cmd("highlight lualine_c_normal guifg=#1e1e2e")
