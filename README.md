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

You may need to run one of the outputted commands to temporarily add brew to
your path.

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

Change the default shell

```sh
chsh -s $(which fish)
```

Alternatively

```sh
sudo chsh -s $(which fish) $(whoami)
```

You might need to reboot after this one.

## 5. (Optional) Install casks

```sh
cd ./homebrew/casks/
brew bundle install
cd ../..
```

## 6. (Optional) Sign in to 1password CLI

You can use a service account token using `./fish/local_config.fish`.

Read the documentation for more.
