-- =====================================================================
-- Neovim 0.12+ minimal config
--   plugins: mini.nvim / nvim-treesitter / nvim-lspconfig / lazygit.nvim
--   ~/.config/nvim/init.lua に置く
-- =====================================================================

vim.loader.enable() -- 起動高速化（必ず先頭）

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- ---------------------------------------------------------------------
-- options
-- ---------------------------------------------------------------------
vim.o.autocomplete = true -- 0.12 組み込みのインサートモード補完
vim.o.completeopt = 'menu,menuone,noselect,nearest'
vim.o.pumborder = 'rounded'
vim.o.pummaxwidth = 50

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.undofile = true
vim.o.termguicolors = true

-- ---------------------------------------------------------------------
-- plugins (vim.pack)
--   更新: :PackUpdate → 確認バッファで :write で確定 / :quit で取り消し
--   削除: config から消して :lua vim.pack.del({ 'name' })
-- ---------------------------------------------------------------------

-- treesitter のパーサ更新フックは vim.pack.add より「前」に定義する
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.spec.name == 'nvim-treesitter' and ev.data.kind ~= 'delete' then
      if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
      vim.cmd('TSUpdate')
    end
  end,
})

vim.pack.add({
  'https://github.com/nvim-mini/mini.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  'https://github.com/kdheepak/lazygit.nvim',
  'https://github.com/rebelot/kanagawa.nvim'
})

vim.api.nvim_create_user_command('PackUpdate', function() vim.pack.update() end, {})

-- ---------------------------------------------------------------------
-- mini.nvim（ファジーファインダ / ファイラ / statusline など）
-- ---------------------------------------------------------------------
require('mini.basics').setup({
  options = { extra_ui = true },
  mappings = { windows = true, move_with_alt = true },
})
require('mini.icons').setup()
MiniIcons.mock_nvim_web_devicons() -- 他プラグインの devicons 要求を吸収

require('mini.pick').setup()       -- ファジーファインダ
require('mini.files').setup()      -- ファイラ
require('mini.statusline').setup() -- statusline
require('mini.diff').setup()       -- git 差分サイン
require('mini.surround').setup()
require('mini.ai').setup()
require('mini.pairs').setup()

-- colorscheme（mini.nvim 同梱。好みで tokyonight 等に差し替え可）
pcall(vim.cmd.colorscheme, 'kanagawa')

-- ---------------------------------------------------------------------
-- syntax highlighting (nvim-treesitter / main ブランチ)
-- ---------------------------------------------------------------------
local ensure_installed = {
  'lua', 'vim', 'vimdoc', 'query',
  'python', 'typescript', 'tsx', 'javascript',
  'json', 'yaml', 'toml', 'markdown', 'markdown_inline',
  'html', 'css', 'bash',
}

local installed = require('nvim-treesitter.config').get_installed()
local to_install = vim.iter(ensure_installed)
  :filter(function(p) return not vim.tbl_contains(installed, p) end)
  :totable()
if #to_install > 0 then
  require('nvim-treesitter').install(to_install)
end

-- main ブランチはハイライトを自分で有効化する
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    pcall(vim.treesitter.start)
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- ---------------------------------------------------------------------
-- LSP（設定は nvim-lspconfig が提供、有効化は組み込み API）
-- ---------------------------------------------------------------------
vim.lsp.enable({
  'lua_ls',
  'basedpyright', -- Python: 型チェック・補完
  'ruff',         -- Python: lint / format
  'ts_ls',        -- TypeScript（好みで 'vtsls' に変更可）
})

local sev = vim.diagnostic.severity
vim.diagnostic.config({
  severity_sort = true,
  virtual_text = { current_line = true },
  float = { border = 'rounded', source = true },
  signs = {
    text = { [sev.ERROR] = 'E', [sev.WARN] = 'W', [sev.INFO] = 'I', [sev.HINT] = 'H' },
  },
})

-- ---------------------------------------------------------------------
-- keymaps
--   LSP は 0.12 の既定マップを利用: gra=code action / grn=rename
--   grr=references / gri=implementation / grt=type def / gO=symbols / K=hover
-- ---------------------------------------------------------------------
local map = vim.keymap.set

-- picker
map('n', '<leader>ff', '<cmd>Pick files<cr>',      { desc = 'Find files' })
map('n', '<leader>fg', '<cmd>Pick grep_live<cr>',  { desc = 'Live grep (要 ripgrep)' })
map('n', '<leader>fb', '<cmd>Pick buffers<cr>',    { desc = 'Buffers' })
map('n', '<leader>fh', '<cmd>Pick help<cr>',       { desc = 'Help tags' })
map('n', '<leader>fd', '<cmd>Pick diagnostic<cr>', { desc = 'Diagnostics' })
map('n', '<leader>fr', '<cmd>Pick resume<cr>',     { desc = 'Resume picker' })

-- filer
map('n', '<leader>e', function()
  local path = vim.api.nvim_buf_get_name(0)
  MiniFiles.open(vim.uv.fs_stat(path) and path or vim.uv.cwd())
end, { desc = 'File explorer' })

-- lazygit
map('n', '<leader>gg', '<cmd>LazyGit<cr>',            { desc = 'LazyGit' })
map('n', '<leader>gf', '<cmd>LazyGitCurrentFile<cr>', { desc = 'LazyGit (current file repo)' })

-- misc
map('n', '<leader>cf', function() vim.lsp.buf.format({ async = true }) end, { desc = 'Format' })
map('n', '<esc>', '<cmd>nohlsearch<cr>', { desc = 'Clear search highlight' })
