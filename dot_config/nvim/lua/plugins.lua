-- bootstrap for lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  -- Appearance
  {
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd("colorscheme tokyonight")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    version = "0.8.1",
    event = "BufReadPre",
    build = ':TSUpdate',
    dependencies = {
      "p00f/nvim-ts-rainbow",
      {
        "yioneko/nvim-yati",
        version = "*",
      },
    },
    config = function()
      require("rc/treesitter")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    version = "2.20.2",
    event = "BufReadPre",
    config = function()
      require("rc/indent-blankline")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "3.1.0",
    event = "BufAdd",
    dependencies = {
      "kyazdani42/nvim-web-devicons"
    },
    config = true,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    config = true,
  },
  {
    "petertriho/nvim-scrollbar",
    event = "VimEnter",
    config = true,
  },
  {
    "kevinhwang91/nvim-hlslens",
    event = "SearchWrapped",
    config = function()
      -- require('hlslens').setup() is not required
      require("scrollbar.handlers.search").setup({
          -- hlslens config overrides
      })
    end,
  },
  {
    "j-hui/fidget.nvim",
    event = "VimEnter",
    config = true,
  },
  -- LSP
  {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = { "InsertEnter" },
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lua",
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-emoji",
      {
        "windwp/nvim-autopairs",
        config = function() 
          require('rc/autopairs') 
        end,
      },
      {
        "windwp/nvim-ts-autotag",
        config = true,
      },
    },
    config = function()
      require('rc/nvim-cmp')
    end,
  },
  {
    "neovim/nvim-lspconfig",
    version = '0.1.4',
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      {
        "williamboman/mason.nvim",
        config = true,
      },
     "folke/lsp-colors.nvim",
    }
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    event = "InsertEnter",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('rc/null-ls')
    end,
  },
  -- Git
  {
    "lewis6991/gitsigns.nvim",
    event = "InsertEnter",
    config = function()
      require('gitsigns').setup()
      require("scrollbar.handlers.gitsigns").setup()
    end
  },

  -- Tools
  {
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
  },
  "rhysd/committia.vim",
  {
    "unblevable/quick-scope",
    event = "BufReadPre",
  },
  {
    'numToStr/Comment.nvim',
    event = "BufReadPost",
    config = function()
      require('Comment').setup({
        ignore = '^$'
      })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = "MarkdownPreviewToggle",
    run = function() vim.fn["mkdp#util#install"]() end,
    config = function()
      vim.g.mkdp_auto_start = 0
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = true,
    init = function()
      vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle("workspace_diagnostics") end, {silent = true, noremap = true})
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    tag = "0.1.0",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    init = function()
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<leader>ff", function()
        require("telescope.builtin").find_files()
      end, opts)
      vim.keymap.set("n", "<leader>fg", function()
        require("telescope.builtin").live_grep()
      end, opts)
      vim.keymap.set("n", "<leader>bf", function()
        require("telescope.builtin").buffers()
      end, opts)
      vim.keymap.set("n", "<leader>fb", function()
        require("telescope").extensions.file_browser.file_browser()
      end, opts)
    end,
    config = function()
      require("rc/telescope")
    end,
  },
},{
  -- lazy.nvim options
  checker = { enabled = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  debug = false,
})

vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>")
