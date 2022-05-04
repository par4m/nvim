vim.g.gruvbox_dark_float = false
vim.g.gruvbox_dark_sidebar = true
-- vim.g.gruvbox_colors = {bg = "#282828" , bg_float = "#282828" , bg_sidebar = "#282828", bg2 = "#282828" }
-- vim.g.gruvbox_colors = {bg = "#282828"}
-- vim.g.gruvbox_theme = { TabLineSel = { bg = "bg", fg="fg" }, TabLineFill = { bg = "bg" } }
-- vim.g.gruvbox_theme = { BufferLineFill = { bg = "#282828" } , BufferLineIndicatorSelected = { fg = "#32302F"} }
vim.g.gruvbox_theme = { BufferLineFill = { bg = "#282828" } }
--- Load the colorscheme
vim.cmd([[colorscheme gruvbox-flat]])
-- vim.g.colorscheme = "gruvbox-flat"
vim.cmd([[
highlight ErrorFloat guibg=#282828
highlight HintFloat guibg=#282828
highlight InfoFloat guibg=#282828
highlight WarningFloat guibg=#282828
" highlight BufferLineCloseButton guibg=#282828
" highlight CmpPmenu         guibg=#32302F)
" highlight CmpPmenuBorder   guifg=#615750)
]])

vim.cmd("highlight! link CmpPmenu         Pmenu")
vim.cmd("highlight! link CmpPmenuBorder   Pmenu")
vim.cmd("highlight! CmpPmenu         guibg=#32302F")
vim.cmd("highlight! CmpPmenuBorder   guifg=#615750")
-- vim.cmd("highlight link NvimTreeVertSplit NONE")
-- vim.cmd("highlight NvimTreeVertSplit guifg=#282828 guibg=#282828")
vim.cmd("highlight StatusLine guibg=#32302F")
vim.cmd("highlight NvimTreeStatusLineNC guibg=nvim_treebg guifg=nvim_treebg")
vim.cmd("highlight NvimTreeWinSeparator guibg=#282828 guifg=#282828")

-- StatusLine
custom_lualine = require("lualine.themes.gruvbox")
custom_lualine.normal.c.bg = "#32302F"
custom_lualine.visual.c.bg = "#32302F"
custom_lualine.insert.c.bg = "#32302F"
custom_lualine.inactive.c.bg = "#32302F"
custom_lualine.command.c.bg = "#32302F"
custom_lualine.command.c.fg = "#937F74"
custom_lualine.visual.c.fg = "#937F74"
custom_lualine.replace.c.bg = "#32302F"
