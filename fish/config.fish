if status --is-interactive
  fish_add_path ~/scripts
end
set -gx EDITOR nvim
set -gx CLICOLOR 1
set -gx fish_greeting
fish_config prompt choose arrow
fish_add_path ~/bin
if test -e /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
end
if test -e /home/linuxbrew/.linuxbrew/bin/brew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end
