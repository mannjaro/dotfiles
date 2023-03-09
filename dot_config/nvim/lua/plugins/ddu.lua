return {
  "Shougo/ddu.vim",
  dependencies = {
    "vim-denops/denops.vim",
    "Shougo/ddu-ui-ff",
    "Shougo/ddu-filter-matcher_substring",
    "Shougo/ddu-source-file_rec",
    "Shougo/ddu-ui-filer",
    "Shougo/ddu-source-file",
    "Shougo/ddu-kind-file",
    "Shougo/ddu-column-filename",
  },
  keys = {
    {";d", "<cmd>call ddu#start({'name': 'filer', 'uiParams': {'filer': {'search': expand('%:p')}},})<cr>"},
    {";f", "<cmd>call ddu#start()<cr>"}
  },
  -- init = function()
  --   vim.keymap.set("n", ";f", "<cmd>call ddu#start({})<cr>")
  -- end,
  config = function()
    vim.fn["ddu#custom#patch_global"]{
      ui = "ff",
      uiParams = {
        ff = {
          split = "floating",
          filterSplitDirection = "floating",
          previewFloating = true,
          previewSplit = "vertical",
          startFilter = {
            v = true
          },
          autoAction = {
            name = "preview",
            delay = 50,
          }
        }
      },
      sourceOptions = {
        _ = {
          matchers = {"matcher_substring"},
        }
      },
      sources = {
        {
          name = "file_rec"
        }
      },
      kindOptions = {
        file = {
          defaultAction = "open"
        }
      }
    }
    vim.fn["ddu#custom#patch_local"]("filer", {
      ui = "filer",
      sources = {
        {
          name = "file",
          params = {}
        }
      },
      sourceOptions = {
        _ = {
          columns = {"filename"}
        }
      },
      kindOptions = {
        file = {
          defaultAction = "open"
        }
      },
      uiParams = {
        filer = {
          winWidth = 40,
          split = "vertical",
          splitDirection = "topleft",
        }
      }
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "ddu-ff-filter",
      callback = function()
        vim.keymap.set("i", "<cr>", "<esc><cmd>call ddu#ui#ff#do_action('itemAction')<cr>", { buffer = true })
        vim.keymap.set("i", "<esc>", "<esc><cmd>call ddu#ui#ff#close()<cr>", { buffer = true })
        vim.keymap.set("n", "<cr>", "<esc><cmd>call ddu#ui#ff#close()<cr>", { buffer = true })
        vim.keymap.set("n", "<esc>", "<esc><cmd>call ddu#ui#ff#close()<cr>", { buffer = true })
        vim.keymap.set("n", "q", "<cmd>call ddu#ui#ff#do_action('quit')<cr>", {buffer = true})
      end,
    })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "ddu-ff",
      callback = function()
        vim.wo.cursorline = true
        vim.keymap.set("n", "<cr>", "<cmd>call ddu#ui#ff#do_action('itemAction')<cr>", { buffer = true })
        vim.keymap.set("n", "<space>", "<cmd>call ddu#ui#ff#do_action('toggleSelectItem')<cr>", { buffer = true })
        vim.keymap.set("n", "i", "<cmd>call ddu#ui#ff#do_action('openFilterWindow')<cr>", { buffer = true })
        vim.keymap.set("n", "q", "<cmd>call ddu#ui#ff#do_action('quit')<cr>", { buffer = true })
        vim.keymap.set("n", "<esc>", "<cmd>call ddu#ui#ff#do_action('quit')<cr>", { nowait = true, buffer = true })
      end,
    })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "ddu-filer",
      callback = function()
        vim.keymap.set("n", "<esc>", "<cmd>call ddu#ui#filer#do_action('quit')<cr>", {nowait = true, buffer = true})
        vim.keymap.set("n", "<cr>", function()
          return vim.fn["ddu#ui#filer#is_tree"]() and 
          "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow'})<CR>" 
          or "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'open'})<CR>"
        end, {expr=true, buffer = true })
        vim.keymap.set("n", "..", "<cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow', 'params': {'path': '..'}})<cr>", { buffer = true })
        vim.keymap.set("n", "t", "<cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'newFile'})<cr>", { buffer = true })
      end,
    })
  end,
}
