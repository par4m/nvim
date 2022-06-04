-- :help options
o = vim.opt
o.lazyredraw = true
o.redrawtime = 1000
o.backup = false -- creates a backup file
o.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
o.cmdheight = 1 -- more space in the neovim command line for displaying messages
o.completeopt = { "menuone", "noselect" } -- mostly just for cmp
o.conceallevel = 0 -- so that `` is visible in markdown files
o.fileencoding = "utf-8" -- the encoding written to a file
o.hlsearch = true -- highlight all matches on previous search pattern
o.ignorecase = true -- ignore case in search patterns
o.mouse = "a" -- allow the mouse to be used in neovim
o.pumheight = 10 -- pop up menu height
o.showmode = false -- we don't need to see things like -- INSERT -- anymore
o.showtabline = 2 -- always show tabs
o.smartcase = true -- smart case
o.smartindent = true -- make indenting smarter again
o.splitbelow = true -- force all horizontal splits to go below current window
o.splitright = true -- force all vertical splits to go to the right of current window
o.swapfile = false -- creates a swapfile
o.termguicolors = true -- set term gui colors (most terminals support this)
o.timeoutlen = 500 -- time to wait for a mapped sequence to complete (in milliseconds)
o.undofile = false -- enable persistent undo
o.updatetime = 250 -- faster completion (4000ms default)
o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
o.expandtab = true -- convert tabs to spaces
o.shiftwidth = 2 -- the number of spaces inserted for each indentation
o.tabstop = 2 -- insert 2 spaces for a tab
o.cursorline = true -- highlight the current line
o.number = true -- set numbered lines
o.relativenumber = false -- set relative numbered lines
o.numberwidth = 4 -- set number column width to 2 {default 4}
o.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
o.wrap = false -- display lines as one long line
o.scrolloff = 8 -- is one of my fav
o.sidescrolloff = 8
o.guifont = "monospace:h17" -- the font used in graphical neovim applications
o.shortmess:append("c")
-- o.fcs='eob: '                             -- character shown for empty lines at the end of buffer
o.fillchars = { eob = " " }
o.laststatus = 3 -- global statusline
o.belloff = all -- turn off flashing
o.shadafile = "NONE"
o.shadafile = ""
-- o.fillchars = {
-- vert = "| ", -- alternatives │
--   fold = " ",
-- eob = " ", -- suppress ~ at EndOfBuffer
--   diff = "╱", -- alternatives = ⣿ ░ ─
--    msgsep = "‾",
--   foldopen = "▾",
--  foldsep = "│",
--  foldclose = "▸",
-- }
o.fillchars = {
	fold = " ", -- remove folding chars
	-- vert = " ", -- set vsplit chars
	eob = " ", -- suppress ~ at EndOfBuffer
}
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd("set re=0")
vim.cmd([[set iskeyword+=-]])
-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
-- vim.cmd("autocmd VimEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o")
vim.cmd([[au BufEnter * set fo-=c fo-=r fo-=o]]) -- Stop new line comments.

-- Disable built in plugins
local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end
