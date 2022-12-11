vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)
  -- Packer can manage itself
  use {'wbthomason/packer.nvim', opt = true}
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
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "main",
    requires = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
  use {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.0',
    after = colorscheme,
    config = function()
      require('config/telescope')
    end,
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end)
