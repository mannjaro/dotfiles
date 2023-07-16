-- return {
--   "lukas-reineke/indent-blankline.nvim",
--   config = function()
--     vim.opt.list = true
--     vim.opt.listchars:append "eol:↴"
--     vim.cmd [[highlight IndentBlanklineIndent1 guifg=#dedede gui=nocombine]]
--     require("indent_blankline").setup{
--       space_char_blankline = " ",
--       show_current_context = true,
--       show_current_context_start = true,
--       char_highlight_list = {
--         'IndentBlanklineIndent1'
--       }
--     }
--   end,
-- }

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

return {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
        require("indent_blankline").setup {
            char = "",
            char_highlight_list = {
                "IndentBlanklineIndent1",
                "IndentBlanklineIndent2",
            },
            space_char_highlight_list = {
                "IndentBlanklineIndent1",
                "IndentBlanklineIndent2",
            },
            show_trailing_blankline_indent = false,
        }
    end
}
