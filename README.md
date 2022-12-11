# Dotfiles

## Usage

```sh
zsh -c "$(curl -#fL raw.githubusercontent.com/mannjaro/dotfiles/main/setup.sh)"
```

## chezmoi usage

管理対象への追加

```sh
chezmoi add $file
```

管理対象の編集

```sh
chezmoi edit $file
```

ローカルへの適応

```sh
chezmoi apply
```
