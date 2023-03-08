if status --is-interactive
  fish_add_path ~/scripts
end
set -gx EDITOR nvim
set -gx CLICOLOR 1
set -gx fish_greeting
fish_config prompt choose arrow
fish_add_path ~/bin
fish_add_path ~/av/tools
if test -e /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
end
if test -e /home/linuxbrew/.linuxbrew/bin/brew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

fish_config prompt choose informative_vcs

# Git
abbr gs git status
abbr gd git diff
abbr gds git diff --staged
abbr gb git branch
abbr ga git add
abbr gc git commit
abbr gco git checkout
abbr gp git push
abbr gpu git push -u origin HEAD
abbr gr git restore
abbr gl git log
abbr gpull git pull

# misc
abbr cls clear
abbr issues gh issue list -a @me
abbr pr gh pr
function current_issue
    git branch --show-current | grep -o -E '[0-9]+'
end
abbr ISSUE --position=anywhere -f current_issue

# other
if test -e ~/.config/fish/local_config.fish
    source ~/.config/fish/local_config.fish
end
