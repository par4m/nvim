vim.o.background = "light"
vim.g.gruvbox_material_background = "soft"
vim.g.gruvbox_material_diagnostic_line_highlight = 1
vim.g.gruvbox_material_sign_column_background = "none"
vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_diagnostic_line_highlight = 1
vim.g.gruvbox_material_better_performance = 1

-- Custom highlights

vim.cmd([[
" augroup MyColors
" autocmd!
" autocmd ColorScheme * highlight NormalFloat guibg=#282828
" autocmd ColorScheme * highlight ErrorFloat guibg=#282828
" autocmd ColorScheme *  highlight HintFloat guibg=#282828
" autocmd ColorScheme *  highlight InfoFloat guibg=#282828
" autocmd ColorScheme *  highlight WarningFloat guibg=#282828
" autocmd ColorScheme * highlight link NvimTreeFolderIcon NONE
" autocmd ColorScheme * highlight NvimTreeNormal guifg=#aa9987 guibg=#282828
" autocmd ColorScheme *  highlight NvimTreeFolderIcon guifg=#7c6f64
" autocmd ColorScheme * highlight NvimTreeRootFolder guifg=#ddc7a1
" autocmd ColorScheme * highlight NvimTreeSymlink guifg=#7daea3
" autocmd ColorScheme * highlight NvimTreeFolderName guifg=#aa9987
" autocmd ColorScheme * highlight NvimTreeEmptyFolderName guifg=#7c6f64
" autocmd ColorScheme * highlight NvimTreeOpenedFolderName guifg=#d3869b
" autocmd ColorScheme * highlight NvimTreeOpenedFile guifg=#d3869b
" autocmd ColorScheme * highlight NvimTreeGitDirty guifg=#b47109
" autocmd ColorScheme * highlight NvimTreeGitNew guifg=#6f8352
" autocmd ColorScheme * highlight NvimTreeGitDeleted guifg=#c14a4a
" autocmd ColorScheme * highlight NvimTreeSpecialFile guifg=#d8a657
" autocmd ColorScheme * highlight NvimTreeIndentMarker guifg=#5a524c
" autocmd ColorScheme * highlight NvimTreeImageFile guifg=#d4be98
" augroup end
]])

-- vim.cmd([[
-- function! s:gruvbox_material_custom() abort
--       " Link a highlight group to a predefined highlight group.
--       " See `colors/gruvbox-material.vim` for all predefined highlight groups.
--     highlight! link NvimTreeNormal NONE
--     highlight! link NvimTreeFolderIcon NONE
--     highlight NormalFloat guibg=#282828
--     highlight ErrorFloat guibg=#282828
--     highlight HintFloat guibg=#282828
--     highlight InfoFloat guibg=#282828
--     highlight WarningFloat guibg=#282828
--     highlight link NvimTreeFolderIcon NONE
--     highlight NvimTreeNormal guifg=#aa9987 guibg=#282828
--     highlight NvimTreeFolderIcon guifg=#7c6f64
--     highlight NvimTreeRootFolder guifg=#ddc7a1
--     highlight NvimTreeSymlink guifg=#7daea3
--     highlight NvimTreeFolderName guifg=#aa9987
--     highlight NvimTreeEmptyFolderName guifg=#7c6f64
--     highlight NvimTreeOpenedFolderName guifg=#d3869b
--     highlight NvimTreeOpenedFile guifg=#d3869b
--     highlight NvimTreeGitDirty guifg=#b47109
--     highlight NvimTreeGitNew guifg=#6f8352
--     highlight NvimTreeGitDeleted guifg=#c14a4a
--     highlight NvimTreeSpecialFile guifg=#d8a657
--     highlight NvimTreeIndentMarker guifg=#5a524c
--     highlight NvimTreeImageFile guifg=#d4be98
--     endfuntion
--     augroup GruvboxMaterialCustom
--       autocmd!
--        call s:gruvbox_material_custom()
--     augroup END
--
--     colorscheme gruvbox-material
-- ]])
--

-- vim.cmd("hi WinSeparator guibg=#282828") --change background color of window seperator

vim.cmd("colorscheme gruvbox-material")
