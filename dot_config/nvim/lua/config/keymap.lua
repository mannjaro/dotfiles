local keymap = vim.keymap

keymap.set('n', '<ESC><ESC>', ':nohlsearch<CR><ESC>')
keymap.set('n', 'j', 'gj')
keymap.set('n', 'k', 'gk')
keymap.set('n', '<Down>', 'gj')
keymap.set('n', '<Up>', 'gk')

keymap.set('t', '<ESC>', '<C-\\><C-n>')
keymap.set('n', '<C-n>', '<Cmd>bnext<CR>')
keymap.set('t', '<C-n>', '<Cmd>bnext<CR>')
keymap.set('n', '<C-p>', '<Cmd>bprevious<CR>')
keymap.set('t', '<C-p>', '<Cmd>bprevious<CR>')
keymap.set("n", "<leader>l", "<cmd>Lazy<cr>")

