-- Needed for some themes not every
local nvim_tree_shift = {
	function()
		return string.rep(" ", require("nvim-tree").config.view.width - 100)
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
	extensions = { "nvim-tree" },
})

--[[ vim.cmd("highlight lualine_c_normal guibg=#2E3440") ]]
--[[ vim.cmd("highlight lualine_x_filetype_DevIconLua_normal guibg=#2E3440") ]]
--[[ vim.cmd("highlight lualine_x_filetype_DevIconLua_inactive guibg=#2E3440") ]]
--[[ vim.cmd("highlight lualine_x_filetype_DevIconLua_command guibg=#2E3440") ]]
--[[ vim.cmd("highlight lualine_x_filetype_DevIconLua_insert guibg=#2E3440") ]]
--[[ vim.cmd("highlight lualine_x_filetype_DevIconLua_visual guibg=#2E3440") ]]
vim.cmd("highlight lualine_c_normal guibg=#1e1e2e")
vim.cmd("highlight lualine_x_filetype_DevIconLua_normal guibg=#1e1e2e")
vim.cmd("highlight lualine_x_filetype_DevIconLua_inactive guibg=#1e1e2e")
vim.cmd("highlight lualine_x_filetype_DevIconLua_command guibg=#1e1e2e")
vim.cmd("highlight lualine_x_filetype_DevIconLua_insert guibg=#1e1e2e")
vim.cmd("highlight lualine_x_filetype_DevIconLua_visual guibg=#1e1e2e")
