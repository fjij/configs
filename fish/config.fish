if status --is-interactive
  fish_add_path ~/scripts
end

set -gx EDITOR nvim
set -gx CLICOLOR 1

fish_add_path ~/bin
fish_add_path ~/.radicle/bin
fish_add_path ~/.yarn/bin
fish_add_path ~/.yarn/global/node_modules/bin
fish_add_path ~/.cargo/bin

eval $(/opt/homebrew/bin/brew shellenv)
eval $(direnv hook fish)

alias cat=bat
