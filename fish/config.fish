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

if op --version >> /dev/null; and test -e ~/.config/op/plugins.sh
    source ~/.config/op/plugins.sh
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
function git_branch_delete_interactive
    echo git branch --delete (git_branch_choose_interactive)
end
abbr gbd -f git_branch_delete_interactive
function git_switch_interactive
    echo git switch (git_branch_choose_interactive)
end
abbr gs -f git_switch_interactive
abbr gsc git switch --create
abbr gco git checkout

# Github
function gh_clean
    set closed_branches (gh pr list --author=@me --state=closed --json='headRefName' | jq -r '.[] | .headRefName')
    for branch in $closed_branches
        # check if branch exists
        if git rev-parse --verify $branch 2&>/dev/null
            git branch --delete $branch
        end
    end
end

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
