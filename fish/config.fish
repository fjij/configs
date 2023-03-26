if status --is-interactive
  fish_add_path ~/scripts
end
set -gx EDITOR nvim
set -gx CLICOLOR 1
set -gx MANPAGER 'sh -c \'col -bx | bat -l man -p\''
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

# Git
abbr g git status
abbr gl git log
abbr gd git diff
abbr gds git diff --staged
abbr ga git add
abbr gc git commit
abbr gr git restore
abbr gp git push
abbr gpu git push -u origin HEAD
abbr gpull git pull
abbr gb git branch
function git_branch_choose_interactive
    git for-each-ref --format='%(refname:short)' refs/heads/ | fzf  --height=~20 --reverse
end
abbr gbd git branch --delete
function git_branch_delete_interactive
    echo "Delete branch:" && git_branch_choose_interactive | xargs git branch --delete
end
abbr gbdi git_branch_delete_interactive
abbr gs git switch
function git_switch_interactive
    echo "Switch branch:" && git_branch_choose_interactive | xargs git switch
end
abbr gsi git_switch_interactive
abbr gsc git switch --create
abbr gco git checkout

# misc
abbr x exit
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
