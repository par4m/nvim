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
