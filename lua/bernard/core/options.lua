local opt = vim.opt

-- numbers
opt.relativenumber = true
opt.number = true

-- tabs and indents
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- dash
opt.iskeyword:append("-")

-- general
opt.backup = false
opt.completeopt = "menuone,noselect"
opt.fileencoding = "utf-8"
opt.hlsearch = true
opt.mouse = "a"
opt.swapfile = false
opt.undofile = true
opt.updatetime = 300
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.cmdheight = 2

-- Vimspector options
vim.cmd([[
let g:vimspector_sidebar_width = 85
let g:vimspector_bottombar_height = 15
let g:vimspector_terminal_maxwidth = 70
]])
