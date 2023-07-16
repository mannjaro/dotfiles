# Dotfiles

## Usage

Install and apply dotfiles

```sh
$ sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```

Update from remote

```sh
$ chezmoi update
```

### chezmoi usage

Adding to the management target

```sh
$ chezmoi add $file
```

Edit Managed Items

```sh
$ chezmoi edit $file
```

Apply to local

```sh
$ chezmoi apply
```

Apply to remote

```sh
$ git commit
$ git push
```
