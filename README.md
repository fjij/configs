# configs

**Update (September 24, 2024): I am archiving this repository. Check out my [nix
configs](https://github.com/fjij/nix-configs) instead!**

Dotfiles and script to install programs

## Basic Setup

This section should be automated through the bootstrap script.

```sh
./bootstrap
```

### 1. Clone this repo via SSH

```sh
git clone git@github.com:fjij/configs.git
```

### 2. Install symlinks

```sh
./install_symlinks
```

### 3. Install Homebrew

**Mac:**

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**Linux:**

```sh
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

You may need to run one of the outputted commands to temporarily add brew to
your path.

**Apple Silicon Mac:**

```sh
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/$USER/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

**Linux:**

```sh
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/$USER/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

### 4. Install shell programs from Brewfile

```sh
brew bundle install --file ./homebrew/Brewfile
```

### 5. Set fish as default shell

Add fish to the list of valid shells

```sh
echo $(which fish) | sudo tee -a /etc/shells
```

Change default shell

**Mac:**

```sh
chsh -s $(which fish)
```

**Linux:**

```sh
sudo chsh -s $(which fish) $(whoami)
```

You may need to reboot or restart your terminal after this one.

## Configuring CLI Tools

### 1. Use SSH for GitHub CLI

The GitHub CLI clones using HTTPS by default, which isn't my preferred option.
Run this command to make it use SSH instead.

```sh
gh config set git_protocol ssh
```

## Decrypting the Secret Folder

After installing the CLI tools, you should be able to decrypt the secret folder
using the Configs Password.

```sh
./decrypt_secret
```

## GUI Programs Setup

### 1. Install GUI programs from Brewfile

```sh
brew bundle install --file ./homebrew/casks/Brewfile
```

### 2. Configure UnnaturalScrollWheels and MeetingBar

These programs need to be configured to auto-start.

### 3. Configure Yabai

```sh
yabai --start-service
```

You'll have to run this again after enabling accessibility control.

### 3. Install Fonts

Install the fonts directly from the secret folder.

### (Optional, Mac Only) Disable font smoothing

If fonts look jagged on external monitors, you can run this to disable font
smoothing. Hopefully it looks better. This probably won't make much of a
difference thought.

```sh
defaults -currentHost write -g AppleFontSmoothing -int 0
sudo reboot
```

## Mac Setup Guide

### 1. Increase Key Repeat

In keyboard settings, update key repeat and delay to the following values:

![key repeat](./images/key_repeat.png)

### 2. Rebind Caps Lock to ESC

Also in the keyboard settings, this can be done by clicking "Modifier Keys...".

### 3. Disable startup sound

Go to "System Settings > Sound > Play sound on startup" and disable it.
