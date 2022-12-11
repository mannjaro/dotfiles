# 各モードでデフォルトキーバインドを呼び出し
for mode in default insert visual
    fish_default_key_bindings -M $mode
end
fish_vi_key_bindings --no-erase
set fish_key_bindings fish_vi_key_bindings
