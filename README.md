# configs

Dotfiles and script to install programs

## 1. Install symlinks

```sh
./install_symlinks
```

## 2. Install homebrew

```sh
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## 3. Install programs from Brewfile

```sh
cd ./homebrew/
brew bundle install
cd ..
```

## 4. Set fish as default shell

Add fish to the list of valid shells

```sh
echo $(which fish) | sudo tee -a /etc/shells
```

Change the default shell (you might need to sudo)

```sh
chsh -s $(which fish)
```

You might need to reboot after this one.

## 5. (Optional) Install casks

```sh
cd ./homebrew/casks/
brew bundle install
cd ../..
```
