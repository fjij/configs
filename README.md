# configs

Dotfiles and script to install programs

## Install homebrew

```sh
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Install programs from Brewfile

```sh
brew bundle install
```

## Set fish as default shell

Add fish to the list of valid shells

```sh
echo $(which fish) | sudo tee -a /etc/shells
```

Change the default shell (you might need to sudo)

```sh
chsh -s $(which fish)
```
