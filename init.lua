local present, impatient = pcall(require, "impatient")

if present then
	impatient.enable_profile()
end

-- General Settings --
require("user.options")
require("user.keymaps")
require("user.lazy") -- manage plugins
require("user.keymaps")
--[[ require("lua.cfg") -- manage plugins ]]

-- Theme --
-- require("themes.gruvbox-material") -- change theme
require("themes.catppuccin") -- change theme
require("user.lsp")
require("cfg.rust-tools")
require("user.cmp")
require("cfg.signature")
require("cfg.saga")
require("cfg.null-ls")
require("cfg.autopairs")
require("cfg.treesitter")
require("cfg.bufferline")
require("cfg.lualine")
require("cfg.trouble")
require("cfg.shade")
require("cfg.indent-blankline")
require("cfg.colorizer")
require("cfg.gitsigns")
require("cfg.nvim-tree")
require("cfg.telescope")
require("cfg.comment")
require("cfg.tmux")
require("cfg.code-runner")
require("cfg.sniprun")
require("cfg.truezen")
require("cfg.twilight")
require("cfg.harpoon")
require("cfg.whichkey")
require("cfg.bracey")

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
