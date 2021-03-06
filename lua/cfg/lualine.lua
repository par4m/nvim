local nvim_tree_shift = {
	function()
		return string.rep(" ", require("nvim-tree").config.view.width - 1)
	end,
	cond = require("nvim-tree.view").is_visible,
	color = "Normal",
}
-- require'lualine'.setup {
--   sections = {
--      lualine_a = { nvim_tree_shift, "mode" }
--   }
-- }

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = custom_lualine,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "NvimTree", "TelescopePrompt", "packer" },
		always_divide_middle = false,
		globalstatus = false,
	},
	sections = {
		lualine_a = { nvim_tree_shift, "mode" },
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
