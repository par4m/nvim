-- Needed for some themes not every
local nvim_tree_shift = {
	function()
		return string.rep(" ", require("nvim-tree").config.view.width - 1)
	end,
	cond = require("nvim-tree.view").is_visible,
	color = "Normal",
}

--
-- require("lualine").setup({
-- 	sections = {
-- 		lualine_a = { nvim_tree_shift, "mode" },
-- 	},
-- })

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = custom_lualine, -- change for colorscheme
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "packer", "TelescopePrompt" },
		always_divide_middle = false,
		globalstatus = false,
	},
	sections = {
		lualine_a = { nvim_tree_shift, "mode" },
		-- lualine_a = { "mode" },
		lualine_b = { "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	-- extensions = { "nvim-tree" },
})
