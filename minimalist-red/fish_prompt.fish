#slightly forked from l theme
#based off my bash PS1
function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end
function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
    set -l cyan (set_color 33FFFF)
    set -l blue (set_color 0080FF)
    set -l red (set_color red)
    set -l uzr $red(whoami)
    set -l cwd $cyan(prompt_pwd)
    set -l white (set_color white)
    set -l green (set_color green)
    set -l host $blue(cat /etc/hostname)
    if [ (_git_branch_name) ]
        set git_info $green(_git_branch_name)
        set git_info ":$git_info"
    if [ (_is_git_dirty) ]
        set -l dirty "*"
        set git_info "$git_info$dirty"
        end
     end
    echo -n -s $white'['$uzr$white'@'$host$white'['$cwd $git_info $white']'$white                                                                                                 e'$'
end
