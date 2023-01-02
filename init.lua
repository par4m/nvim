local present, impatient = pcall(require, "impatient")

if present then
	impatient.enable_profile()
end

-- General Settings --
require("user.options")
require("user.keymaps")
require("user.plugins") -- manage plugins

-- Theme --
-- require("themes.gruvbox-material") -- change theme
require("themes.nord") -- change theme
-- require("themes.everblush") -- change theme
-- require "user.colorscheme" -- colorscheme protected call

-- LSP and Completion --
-- require("user.cmp") -- completion settings for nvim-cmp
-- require("user.lsp") --include lsp directory under user, init.lua inside it will be run first

-- Plugin Configs --
-- require "cfg.telescope" -- fuzzy finder
--
--
vim.api.nvim_create_autocmd("CursorHold", { command = "set laststatus=3" })

vim.api.nvim_create_autocmd("CursorHoldI", {
	group = vim.api.nvim_create_augroup("cmp_complete_on_space", {}),
	callback = function()
		local line = vim.api.nvim_get_current_line()
		local cursor = vim.api.nvim_win_get_cursor(0)[2]

		if string.sub(line, cursor, cursor + 1) == " " then
			require("cmp").abort()
		end
	end,
})
