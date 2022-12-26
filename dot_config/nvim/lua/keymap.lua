local keymap = vim.keymap
vim.g.mapleader = " "
keymap.set('n', '<ESC><ESC>', ':nohlsearch<CR><ESC>')
keymap.set('n', 'j', 'gj')
keymap.set('n', 'k', 'gk')


keymap.set('t', '<ESC>', '<C-\\><C-n>')
keymap.set('n', '<C-n>', '<Cmd>bnext<CR>')
keymap.set('t', '<C-n>', '<Cmd>bnext<CR>')
keymap.set('n', '<C-p>', '<Cmd>bprevious<CR>')
keymap.set('t', '<C-p>', '<Cmd>bprevious<CR>')
