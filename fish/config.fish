if status --is-interactive
  fish_add_path ~/scripts
end
set -gx EDITOR nvim
set -gx CLICOLOR 1
set -gx fish_greeting
fish_config prompt choose arrow
fish_add_path ~/bin
