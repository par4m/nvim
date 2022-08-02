-- Example config in lua
vim.g.nord_contrast = true
vim.g.nord_borders = false
vim.g.nord_disable_background = false
vim.g.nord_italic = false
vim.g.nord_uniform_diff_background = true

-- Load the colorscheme
require("nord").set()
vim.cmd("highlight NvimTreeStatusLineNC guibg=nvim_treebg guifg=nvim_treebg")
vim.cmd("highlight StatusLine guibg=nvim_treebg")
vim.cmd("highlight VertSplit guifg=#3B4252")
vim.cmd("highlight NvimTreeWinSeparator guifg=#2E3440")

-- vim.cmd("highlight NvimTreeStatusLine")

-- StatusLine
-- custom_lualine = require("lualine.themes.nord")
