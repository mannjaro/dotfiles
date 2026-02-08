-- タブをスペースとして扱う
vim.opt.expandtab = true

-- 画面上のタブ表示幅を2にする
vim.opt.tabstop = 2

-- 自動インデントや << >> で移動する幅を2にする
vim.opt.shiftwidth = 2

-- 入力中にTabキーを押した時の挙動を2にする
vim.opt.softtabstop = 2
require("config.lazy")

-- 診断のフロートウィンドウに枠線を付ける
vim.diagnostic.config({
  float = { border = "rounded" },
})

-- :Cheatsheet コマンドでチートシートを開く
vim.api.nvim_create_user_command("Cheatsheet", function()
  require("config.cheatsheet").open()
end, {})

-- <leader>? でもチートシートを開ける
vim.keymap.set("n", "<leader>?", "<cmd>Cheatsheet<cr>", { desc = "チートシートを開く" })
