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

-- Only move on if we can require Packer.
local init_packer = function()
  local ok, packer = pcall(require, 'packer')
  if not ok then
    return
  end

  packer.init {
    display = {
      open_fn = function()
        return require('packer.util').float {border = 'rounded'}
      end,
    }
  }
end

init_packer()

--vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)
  -- Packer can manage itself
  use {'wbthomason/packer.nvim'}
  -- lsp
  use 'neovim/nvim-lspconfig'
  use ({
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  })
  use ({
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('config/mason-lspconfig')
    end,
  })
  -- cmp
  use ({ 
    'hrsh7th/nvim-cmp',
    config = function()
      require('config/nvim-cmp')
    end,
  })
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'onsails/lspkind.nvim'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  -- autopair
  use ({
    "windwp/nvim-autopairs",
    config = function() 
      require("config/autopair")
    end
  })
  use 'windwp/nvim-ts-autotag'
  -- appearacne
  local colorscheme = "nightfox.nvim"
  use ({ 
    'EdenEast/nightfox.nvim',
    event = { "VimEnter", "ColorSchemePre" },
    config = function()
      require('config/nightfox')
    end,
  })
  use ({ 
    'kyazdani42/nvim-web-devicons', 
    after = colorscheme, 
  })
  use ({
    'nvim-lualine/lualine.nvim',
    after = colorscheme,
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('config/lualine')
    end,
  })
  use ({
    'akinsho/bufferline.nvim',
    tag = "v3.*", 
    requires = 'kyazdani42/nvim-web-devicons'
  })
  -- treesitter
  use ({
    'nvim-treesitter/nvim-treesitter', 
    run = ":TSUpdate",
    config = function()
      require('config/treesitter')
    end,
  })
  use ({ 
    "p00f/nvim-ts-rainbow", 
    after = { "nvim-treesitter" },
  })
  use ({
    "lukas-reineke/indent-blankline.nvim",
    after = { 'nvim-treesitter' },
    config = function()
      require('config/indent-blankline')
    end,
  })
  -- filer
  use ({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "main",
    event = "VimEnter",
    requires = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require('config/neo-tree')
    end,
  })
  -- fuzzy finder
  use ({
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.0',
    after = colorscheme,
    config = function()
      require('config/telescope')
    end,
    requires = { {'nvim-lua/plenary.nvim'} }
  })
  use {
    "nvim-telescope/telescope-frecency.nvim",
    after = {'telescope.nvim'},
    config = function()
      require"telescope".load_extension("frecency")
    end,
    requires = {"kkharji/sqlite.lua"}
  }
  -- PackerSync when bootstrap
  if packer_bootstrap then
    require('packer').sync()
  end
end)
