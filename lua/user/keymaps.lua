local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local k = vim.api.nvim_set_keymap

--Remap space as leader key
k("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
k("n", "<C-h>", "<C-w>h", opts)
k("n", "<C-j>", "<C-w>j", opts)
k("n", "<C-k>", "<C-w>k", opts)
k("n", "<C-l>", "<C-w>l", opts)

-- k("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
k("n", "<C-Up>", ":resize +2<CR>", opts)
k("n", "<C-Down>", ":resize -2<CR>", opts)
k("n", "<C-Left>", ":vertical resize -2<CR>", opts)
k("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Normal --
-- Navigate buffers with Shift + l/h
k("n", "<S-l>", ":bnext<CR>", opts)
k("n", "<S-h>", ":bprevious<CR>", opts)

-- Navigate buffers with Tab / Shift + Tab
k("n", "<TAB>", ":bnext<CR>", opts)
k("n", "<S-TAB>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
k("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
k("v", "<", "<gv", opts)
k("v", ">", ">gv", opts)

-- Move text up and down
k("v", "<A-j>", ":m .+1<CR>==", opts)
k("v", "<A-k>", ":m .-2<CR>==", opts)

-- Paste without Yank
-- k("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
k("x", "J", ":move '>+1<CR>gv-gv", opts)
k("x", "K", ":move '<-2<CR>gv-gv", opts)
k("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
k("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Save file with Ctrl + s
k("n", "<C-s>", ":w<CR>", opts)

-- Telescope --
k(
  "n",
  "<leader>f",
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false , hidden = true }))<cr>",
  opts
)
k("n", "<c-t>", "<cmd>lua require'telescope.builtin'.live_grep()<cr>", opts)
k("n", "<leader>cd", ":lua require'telescope'.extensions.zoxide.list{}<CR>", opts)

-- Nvim tree

k("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Bufdelete
k("n", "<leader>q", ":Bdelete<cr>", opts)

-- null ls formatting
k("n", "<leader>l", ":lua vim.lsp.buf.format({ async = true })<cr>", opts)

-- Terminal --
-- Better terminal navigation
k("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
k("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
k("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
k("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Vimux --
-- Use F7 to run prompt command
k("n", "<F7>", ":w<CR>:VimuxPromptCommand<cr>", opts)
-- use space + b to run last command
k("n", "<leader>b", ":w<CR>:VimuxRunLastCommand<cr>", opts)
