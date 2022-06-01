local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "none", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "center", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = false, -- show help message on the command line when the popup is visible
	-- triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

-- For Bookmarks --
local harpoon_opts = {
	mode = "n", -- NORMAL mode
	prefix = "m",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local harpoon_mappings = {
	a = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon: Add File" },
	m = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon Menu" },
	n = { '<cmd>lua require("harpoon.ui").nav_next()<cr>', "Harpoon: Next Mark" },
	[","] = { '<cmd>lua require("harpoon.ui").nav_prev()<cr>', "Harpoon: Previous Mark" },
	t = { "<cmd>Telescope harpoon marks<cr>", "Harpoon: Telescope Marks" },
	["1"] = { '<cmd>lua require("harpoon.ui").nav_file(1)<cr>', "Harpoon: File 1" },
	["2"] = { '<cmd>lua require("harpoon.ui").nav_file(2)<cr>', "Harpoon: File 2" },
	["3"] = { '<cmd>lua require("harpoon.ui").nav_file(3)<cr>', "Harpoon: File 3" },
	-- a = { "<cmd>BookmarkAnnotate<cr>", "Annotate" },
	-- c = { "<cmd>BookmarkClear<cr>", "Clear" },
	-- m = { "<cmd>BookmarkToggle<cr>", "Toggle" },
	-- h = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon" },
	-- j = { "<cmd>BookmarkNext<cr>", "Next" },
	-- k = { "<cmd>BookmarkPrev<cr>", "Prev" },
	-- s = { "<cmd>BookmarkShowAll<cr>", "Prev" },
	-- s = {
	--   "<cmd>lua require('telescope').extensions.vim_bookmarks.all({ hide_filename=false, prompt_title=\"bookmarks\", shorten_path=false })<cr>",
	--   "Show",
	-- },
	-- x = { "<cmd>BookmarkClearAll<cr>", "Clear All" },
}

local mappings = {
	-- ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
	-- b = { "<cmd>JABSOpen<cr>", "Buffers" },
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	["h"] = { "<cmd>set invhlsearch<CR>", "Toggle Highlight" },
	["q"] = { "<cmd>Bdelete<CR>", "Buffer Delete" },
	["/"] = { '<cmd>lua require("Comment.api").toggle_current_linewise()<CR>', "Comment" },
	["P"] = { "<cmd>Telescope project project <cr>", "Telescope: Projects" },
	["R"] = { "<cmd>Telescope repo list<cr>", "Telescope: Git Repos" },
	["z"] = { "<cmd>Telescope zoxide list<cr>", "Telescope: Zoxide" },
	["i"] = { "<cmd>IndentBlanklineToggle<cr>", "Indent Lines Toggle" },
	["cd"] = { "<cmd>cd %:p:h<cr>", "CD to Buf Dir" },
	[";"] = { '<cmd>lua require("duck").hatch()<cr>', "Duck: Hatch" },
	["."] = { '<cmd>lua require("duck").cook()<cr>', "Duck: Cook" },
	["M"] = { "<cmd>MarkdownPreviewToggle<cr>", "Markdown Preview: Toggle" },

	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	o = {
		name = "Run",
		-- Code Runner
		r = { "<cmd>RunCode<cr>", "Code Runner: Run Code" },
		f = { "<cmd>RunFile<cr>", "Code Runner: Run File" },
		p = { "<cmd>RunProject<cr>", "Code Runner: Run Project" },
		c = { "<cmd>RunClose<cr>", "Code Runner: Close Runner" },
		-- Vimux
		v = { ":w<CR>:VimuxPromptCommand<cr>", "Vimux: Prompt Command" },
		l = { ":w<CR>:VimuxRunLastCommand<cr>", "Vimux: Run Last Command" },
	},

	r = {
		name = "Replace",
		r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
		w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
		f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
	},

	d = {
		name = "Debug",
		b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
		c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
		o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
		O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
		r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
		l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
		u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
		x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
	},

	-- nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
	-- nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
	-- require("dapui").open()
	-- require("dapui").close()
	-- require("dapui").toggle()

	f = {
		name = "Find",
		b = { "<cmd>Telescope file_browser file_browser<cr>", "Telescope: File Browser" },
		-- c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		f = {
			"<cmd>Telescope find_files theme=dropdown previewer=false hidden=true<cr>",
			"Telescope: Find files",
		},
		t = { "<cmd>Telescope live_grep theme=ivy<cr>", "Telescope: Find Text" },
		h = { "<cmd>Telescope help_tags<cr>", "Telescope: Help" },
		l = { "<cmd>Telescope resume<cr>", "Telescope: Last Search" },
		M = { "<cmd>Telescope man_pages<cr>", "Telescope: Man Pages" },
		r = { "<cmd>Telescope oldfiles<cr>", "Telescope: Recent Files" },
		R = { "<cmd>Telescope registers<cr>", "Telescope: Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Telescope: Keymaps" },
		C = { "<cmd>Telescope commands<cr>", "Telescope: Commands" },
		s = { "<cmd>Telescope luasnip luasnip<cr>", "Telescope: Snippets" },
		y = { "<cmd>Telescope frecency frecency<cr>", "Telescope: frecency" },
		g = { "<cmd>Telescope grep_string<cr>", "Telescope: Find word under cursor" },
		z = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Telescope: Fuzzy Buffer" },
	},

	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>GitBlameToggle<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Diff",
		},
		-- G = {
		-- 	name = "Gist",
		-- 	a = { "<cmd>Gist -b -a<cr>", "Create Anon" },
		-- 	d = { "<cmd>Gist -d<cr>", "Delete" },
		-- 	f = { "<cmd>Gist -f<cr>", "Fork" },
		-- 	g = { "<cmd>Gist -b<cr>", "Create" },
		-- 	l = { "<cmd>Gist -l<cr>", "List" },
		-- 	p = { "<cmd>Gist -b -p<cr>", "Create Private" },
		-- },
	},

	l = {
		name = "LSP",
		i = { ":LspInfo<cr>", "Connected Language Servers" },
		-- k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
		-- K = { "<cmd>Lspsaga hover_doc<cr>", "Hover Commands" },
		-- l = {
		-- 	"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
		-- 	"List Workspace Folders",
		-- },
		-- Trouble --
		t = { "<cmd>TroubleToggle lsp_type_definitions<cr>", "Trouble: Type Definition" },
		w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble: Workspace Diagnostics" },
		m = { "<cmd>TroubleToggle document_diagnostics<cr>", "Trouble: Document Diagnostics" },
		l = { "<cmd>TroubleToggle loclist<cr>", "Trouble: Location List" },
		q = { "<cmd>TroubleToggle quickfix<cr>", "Trouble: Quickfix" },
		-- d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
		-- D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
		-- r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },

		-- Lsp Saga --
		k = { "<cmd>LspSaga signature_help<cr>", "LspSaga: Signature Help" },
		p = { "<cmd>LspSaga preview_definition<cr>", "LspSaga: Definition Preview" },
		K = { "<cmd>Lspsaga hover_doc<cr>", "LspSaga: Hover Doc" },
		d = { "<cmd>Lspsaga lsp_finder<cr>", "LspSaga: Cursor Definition & References" },
		R = { "<cmd>Lspsaga rename<cr>", "LspSaga: Rename" },
		a = { "<cmd>Lspsaga code_action<cr>", "LspSaga: Code Action" },
		e = { "<cmd>Lspsaga show_line_diagnostics<cr>", "LspSaga: Show Line Diagnostics" },
		n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "LspSaga: Go To Next Diagnostic" },
		N = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "LspSaga: Go To Previous Diagnostic" },
		-- symbols outline
		s = { "<cmd>SymbolsOutline<cr>", "SymbolsOutline: Toggle" },
	},
	-- s = {
	--   name = "Surround",
	--   ["."] = { "<cmd>lua require('surround').repeat_last()<cr>", "Repeat" },
	--   a = { "<cmd>lua require('surround').surround_add(true)<cr>", "Add" },
	--   d = { "<cmd>lua require('surround').surround_delete()<cr>", "Delete" },
	--   r = { "<cmd>lua require('surround').surround_replace()<cr>", "Replace" },
	--   q = { "<cmd>lua require('surround').toggle_quotes()<cr>", "Quotes" },
	--   b = { "<cmd>lua require('surround').toggle_brackets()<cr>", "Brackets" },
	-- },

	s = {
		name = "SnipRun",
		l = { "<cmd>SnipRun<cr>", "Run Line" },
		c = { "<cmd>SnipClose<cr>", "Close" },
		f = { "<cmd>%SnipRun<cr>", "Run File" },
		i = { "<cmd>SnipInfo<cr>", "Info" },
		m = { "<cmd>SnipReplMemoryClean<cr>", "Mem Clean" },
		r = { "<cmd>SnipReset<cr>", "Reset" },
		t = { "<cmd>SnipRunToggle<cr>", "Toggle" },
		x = { "<cmd>SnipTerminate<cr>", "Terminate" },
	},

	t = {

		name = "Terminal",
		["1"] = { ":1ToggleTerm<cr>", "1" },
		["2"] = { ":2ToggleTerm<cr>", "2" },
		["3"] = { ":3ToggleTerm<cr>", "3" },
		["4"] = { ":4ToggleTerm<cr>", "4" },
		n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
		u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
		t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},

	T = {
		-- name = "Treesitter",
		-- h = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight" },
		-- p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" },
	},
}

local vopts = {
	mode = "v", -- VISUAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
	["/"] = { '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', "Comment" },
	s = { "<esc><cmd>'<,'>SnipRun<cr>", "Run range" },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
which_key.register(harpoon_mappings, harpoon_opts)
