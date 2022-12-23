local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
vim.cmd [[packadd packer.nvim]]

require('packer').init {
  display = {
    open_fn = require("packer.util").float,
  },
}

return require('packer').startup(function(use)
  -- Packer can manage itself
  use {'wbthomason/packer.nvim'}
  -- lsp
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('config/lsp/cmp')
    end,
    requires = {
       'hrsh7th/cmp-nvim-lsp',
       'hrsh7th/cmp-buffer',
       'hrsh7th/cmp-path',
       'hrsh7th/cmp-cmdline',
       'hrsh7th/cmp-vsnip',
       'hrsh7th/vim-vsnip',
       'hrsh7th/cmp-nvim-lsp-signature-help',
       'hrsh7th/cmp-nvim-lua',
       'f3fora/cmp-spell',
       'onsails/lspkind.nvim',
    }
  }
  use {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end,
  }
  use {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('config/lsp/mason-lspconfig')
    end,
  }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('config/lsp/null-ls')
    end,
  }
  use {
    'windwp/nvim-autopairs',
    config = function() 
      require('config/autopairs') 
    end,
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
      vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle workspace_diagnostics<cr>", {silent = true, noremap = true})
    end
  }
  use 'folke/lsp-colors.nvim'
  -- comment
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('config/Comment')
    end,
  }
  -- appearence
  local colorscheme = "nightfox.nvim"
  use ({ 
    'EdenEast/nightfox.nvim',
    event = { "VimEnter", "ColorSchemePre" },
    config = function()
      require('config/nightfox')
    end,
  })
  use { 
    'kyazdani42/nvim-web-devicons', 
    after = colorscheme, 
  }
  use {
    'nvim-lualine/lualine.nvim',
    after = colorscheme,
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('config/lualine')
    end,
  }
  use {
    'akinsho/bufferline.nvim',
    tag = "v3.*", 
    after = colorscheme,
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('config/bufferline')
    end,
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    event = {'VimEnter'},
    config = function()
      require('config/indent-blankline')
    end,
  }
  use {
    'j-hui/fidget.nvim',
    config = function()
      require"fidget".setup{}
    end,
  }
  use 'unblevable/quick-scope'
  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
    config = function()
      require('config/treesitter')
    end,
  }
  use 'p00f/nvim-ts-rainbow'
  -- filer
  use {
    "nvim-neo-tree/neo-tree.nvim",
    event = 'VimEnter',
    branch = "main",
    requires = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require('config/neo-tree')
    end,
  }
  -- fuzzy finder
  use {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.0',
    after = {colorscheme},
    config = function()
      require('config/telescope')
    end,
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'nvim-telescope/telescope-frecency.nvim',
    after = {colorscheme, 'telescope.nvim'},
    config = function()
      require"telescope".load_extension("frecency")
    end,
    requires = {"kkharji/sqlite.lua"}
  }
  -- markdown-preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
    config = function()
      require('config/markdown-preview')
    end,
  })
  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    after = colorscheme,
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  }
  use 'rhysd/committia.vim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
