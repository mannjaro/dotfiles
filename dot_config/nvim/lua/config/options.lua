local set = vim.opt

-- visual
set.termguicolors = true
set.number = true
-- set.ambiwidth = 'double'
set.wrap = true
set.pumheight = 10
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2

set.expandtab = true
set.autoindent = true
set.smartindent = true

set.showmatch = true
set.matchtime = 1

set.scrolloff = 3
set.sidescrolloff = 3

-- set.cursorline = true

-- backup
set.backup = false 
set.writebackup = false
set.updatetime = 300
set.timeoutlen = 500
set.swapfile = false

-- search
set.ignorecase = true
set.smartcase = true
set.wrapscan = true
set.incsearch = true
set.hlsearch = true

-- editor
set.virtualedit = 'onemore'
set.clipboard = {"unnamed", "unnamedplus"}
set.mouse = "a"
set.timeoutlen = 500
vim.cmd.colorscheme "duskfox"
