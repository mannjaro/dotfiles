local set = vim.opt

set.backup = false 
set.writebackup = false
set.updatetime = 300
set.timeoutlen = 1000
set.swapfile = false

set.virtualedit = 'onemore'

set.number = true
-- set.cursorline = true
set.showmatch = true
set.expandtab = true
set.tabstop = 2
set.wrap = true
set.shiftwidth = 2

set.ignorecase = true
set.smartcase = true
set.wrapscan = true
set.incsearch = true
set.hlsearch = true

set.scrolloff = 3
set.sidescrolloff = 3

set.clipboard = {"unnamed", "unnamedplus"}
set.mouse = 'a'

vim.cmd("autocmd TermOpen * startinsert")
vim.cmd('autocmd TermOpen * setlocal nonumber')
vim.cmd('command! -nargs=* T split | wincmd j | resize 20 | terminal <args>')
