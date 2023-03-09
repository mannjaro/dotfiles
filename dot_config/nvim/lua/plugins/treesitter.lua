return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = "0.8.5.2",
    event = "BufReadPost",
    build = ':TSUpdate',
    dependencies = {
      "mrjones2014/nvim-ts-rainbow",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          "bash",
          "c",
          "cmake",
          "cpp",
          "css",
          "diff",
          "fish",
          "gitignore",
          "go",
          "graphql",
          "html",
          "java",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "php",
          "python",
          "rust",
          "regex",
          "scss",
          "sql",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "yaml",
        },
        matchup = {
          enable = true,
        },
        highlight = {
          enable = true,
        },  
        rainbow = {
          enable = true,
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = 300, -- Do not enable for files with more than n lines, int
          -- colors = {}, -- table of hex strings
          -- termcolors = {} -- table of colour name strings
        },
        autotag = {
          enable = true,
        },
      })
    end,
  },
}
