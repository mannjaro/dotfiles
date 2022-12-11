local keymap = vim.keymap
vim.g.mapleader = ' '
keymap.set('n', '<ESC><ESC>', ':nohlsearch<CR><ESC>')
keymap.set('n', 'j', 'gj')
keymap.set('n', 'k', 'gk')

keymap.set('n', '<Leader>e', '<Cmd>Neotree float reveal_force_cwd toggle<CR>')
keymap.set('n', '<Leader>g', '<Cmd>Neotree toggle git_status<CR>')
