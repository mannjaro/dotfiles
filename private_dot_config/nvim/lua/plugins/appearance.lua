return {
	{
	  "nvim-treesitter/nvim-treesitter",
	  branch = "main",
	  build = ":TSUpdate",
	  opts = {
	    ensure_installed = {
	      "typescript",
	      "tsx",
	      "javascript",
	      "lua",
	      "json",
	      "html",
	      "css",
	      "markdown",
	      "markdown_inline",
	    },
	    highlight = { enable = true },
	    indent = { enable = true },
	  }
	},
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function ()
      vim.cmd.colorscheme("tokyonight")
    end
  }
}
