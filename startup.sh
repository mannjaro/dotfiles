#!bin/sh
if [ ! -d ~/.config/nvim ];then
  echo "Create '~/.config/nvim'"
  mkdir ~/.config/nvim && mkdir ~/.config/nvim/toml
fi

SCRIPT_DIR=$(cd $(dirname $0); pwd)

ln -sf $SCRIPT_DIR/.vimrc ~/.vimrc
ln -sf $SCRIPT_DIR/nvim/init.vim ~/.config/nvim/init.vim
ln -sf $SCRIPT_DIR/nvim/dein.vim ~/.config/nvim/dein.vim
ln -sf $SCRIPT_DIR/nvim/basic.vim ~/.config/nvim/basic.vim
ln -sf $SCRIPT_DIR/nvim/appearance.vim ~/.config/nvim/appearance.vim
ln -sf $SCRIPT_DIR/nvim/keymaps.vim ~/.config/nvim/keymaps.vim
ln -sf $SCRIPT_DIR/nvim/toml/dein.toml ~/.config/nvim/toml/dein.toml
ln -sf $SCRIPT_DIR/nvim/toml/dein_lazy.toml ~/.config/nvim/toml/dein_lazy.toml
