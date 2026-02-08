local M = {}

-- チートシートの内容（自由に追加・編集してOK）
M.lines = {
  "╔══════════════════════════════════════════════════╗",
  "║            Neovim チートシート                   ║",
  "╚══════════════════════════════════════════════════╝",
  "",
  "■ LSP（最重要）",
  "  K           ホバー情報（型やドキュメント）",
  "  gd          定義にジャンプ",
  "  gr          参照一覧",
  "  grn         リネーム（一括変更）",
  "  gra         コードアクション（自動修正）",
  "  gri         実装にジャンプ",
  "",
  "■ 診断（エラー・警告）",
  "  ]d             次の診断へ",
  "  [d             前の診断へ",
  "  Ctrl-w d       診断を表示",
  "  Ctrl-w Ctrl-d  同上",
  "",
  "■ ジャンプリスト",
  "  Ctrl-o      前の位置に戻る",
  "  Ctrl-i      次の位置に進む",
  "",
  "■ タブ（バッファ）操作",
  "  Shift+h         前のタブへ",
  "  Shift+l         次のタブへ",
  "  <leader>bd      タブを閉じる",
  "  <leader>,       バッファピッカー",
  "",
  "■ ファイル・検索",
  "  <leader>ff      ファイル検索",
  "  <leader>fg      テキスト検索（grep）",
  "  <leader>e       エクスプローラーを開く",
  "",
  "■ ターミナル",
  "  Ctrl+`          ターミナルの表示/非表示",
  "",
  "■ 閉じる",
  "  q / Esc     このウィンドウを閉じる",
}

function M.open()
  -- バッファを作成
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, M.lines)
  vim.bo[buf].modifiable = false
  vim.bo[buf].bufhidden = "wipe"

  -- ウィンドウサイズを計算
  local width = 54
  local height = #M.lines
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- フローティングウィンドウで表示
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })

  -- q または Esc で閉じる
  local close = function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end
  vim.keymap.set("n", "q", close, { buffer = buf, nowait = true })
  vim.keymap.set("n", "<Esc>", close, { buffer = buf, nowait = true })
end

return M
