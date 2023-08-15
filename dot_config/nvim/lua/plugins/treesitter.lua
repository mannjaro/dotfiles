return {
    'nvim-treesitter/nvim-treesitter',
    event = "BufReadPost",
    build = ':TSUpdate',
    dependencies = {
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
            autotag = {
                enable = true,
            },
        })
    end,
}
