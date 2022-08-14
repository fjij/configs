if status --is-interactive
  fish_add_path ~/scripts
end

set -gx EDITOR nvim
set -gx CLICOLOR 1

set -gx GOPATH ~/.go

set -gx fish_greeting
abbr -a e nvim

nvm use v16 --silent
fish_config prompt choose arrow
fish_vi_key_bindings

fish_add_path ~/bin
fish_add_path ~/.radicle/bin
fish_add_path ~/.yarn/bin
fish_add_path ~/.yarn/global/node_modules/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/bin/google-cloud-sdk/bin

eval $(/opt/homebrew/bin/brew shellenv)
eval $(direnv hook fish)

alias cat=bat
