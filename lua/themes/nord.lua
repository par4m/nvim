-- Example config in lua
vim.g.nord_contrast = true
vim.g.nord_borders = false
vim.g.nord_disable_background = false
vim.g.nord_italic = false
vim.g.nord_uniform_diff_background = true

-- Load the colorscheme
require("nord").set()
vim.cmd("highlight NvimTreeStatusLineNC guibg=nvim_treebg guifg=nvim_treebg")
-- vim.cmd("highlight NvimTreeStatusLine")

-- StatusLine
-- custom_lualine = require("lualine.themes.nord")
-- custom_lualine.normal.c.bg = "#2E3440"
-- custom_lualine.normal.c.fg = "#2E3440"
-- custom_lualine.visual.c.bg = "#2E3440"
-- custom_lualine.insert.c.bg = "#2E3440"
-- custom_lualine.inactive.c.bg = "#2E3440"
-- custom_lualine.command.c.bg = "#2E3440"
-- custom_lualine.command.c.fg = "#937F74"
-- custom_lualine.visual.c.fg = "#937F74"
-- custom_lualine.replace.c.bg = "#2E3440"
