return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    vim.opt.list = true
    vim.opt.listchars:append "eol:↴"
    vim.cmd [[highlight IndentBlanklineIndent1 guifg=#dedede gui=nocombine]]
    require("indent_blankline").setup{
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,
      char_highlight_list = {
        'IndentBlanklineIndent1'
      }
    }
  end,
}

