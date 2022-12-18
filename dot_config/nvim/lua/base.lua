local set = vim.opt

set.backup = false 
set.writebackup = false
set.updatetime = 300
set.timeoutlen = 1000
set.swapfile = false

set.virtualedit = 'onemore'

set.number = true
--set.cursorline = true
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

vim.g.did_install_default_menus = 1
vim.g.did_install_syntax_menu   = 1
vim.g.did_indent_on             = 1
-- vim.g.did_load_filetypes        = 1
vim.g.did_load_ftplugin         = 1
vim.g.loaded_2html_plugin       = 1
vim.g.loaded_gzip               = 1
vim.g.loaded_man                = 1
vim.g.loaded_matchit            = 1
vim.g.loaded_matchparen         = 1
vim.g.loaded_netrwPlugin        = 1
vim.g.loaded_remote_plugins     = 1
vim.g.loaded_shada_plugin       = 1
vim.g.loaded_spellfile_plugin   = 1
vim.g.loaded_tarPlugin          = 1
vim.g.loaded_tutor_mode_plugin  = 1
vim.g.loaded_zipPlugin          = 1
vim.g.skip_loading_mswin        = 1

vim.cmd("autocmd TermOpen * startinsert")
vim.cmd('autocmd TermOpen * setlocal nonumber')
vim.cmd('command! -nargs=* T split | wincmd j | resize 20 | terminal <args>')
