function fish_prompt

    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l magenta (set_color -o magenta)
    set -l red (set_color -o red)
    set -l blue (set_color -o blue)
    set -l green (set_color -o green)
    set -l normal (set_color normal)

    set -g __fish_git_prompt_show_informative_status 1
    set -g __fish_git_prompt_hide_untrackedfiles 1

    set -g __fish_git_prompt_color_branch magenta
    set -g __fish_git_prompt_showupstream "informative"
    set -g __fish_git_prompt_char_upstream_ahead "↑"
    set -g __fish_git_prompt_char_upstream_behind "↓"
    set -g __fish_git_prompt_char_upstream_prefix ""

    set -g __fish_git_prompt_char_stagedstate "●"
    set -g __fish_git_prompt_char_dirtystate "✚"
    set -g __fish_git_prompt_char_untrackedfiles "…"
    set -g __fish_git_prompt_char_conflictedstate "✖"
    set -g __fish_git_prompt_char_cleanstate "✔"

    set -g __fish_git_prompt_color_dirtystate blue
    set -g __fish_git_prompt_color_stagedstate yellow
    set -g __fish_git_prompt_color_invalidstate red
    set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
    set -g __fish_git_prompt_color_cleanstate green

    if not set -q -g __fish_git_functions_defined
        set -g __fish_git_functions_defined
        function _git_branch_name
            echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
        end
        function _is_git_dirty
            echo (git status -s --ignore-submodules=dirty ^/dev/null)
        end
    end


    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end


    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l magenta (set_color -o magenta)
    set -l red (set_color -o red)
    set -l blue (set_color -o blue)
    set -l green (set_color -o green)
    set -l normal (set_color normal)


    #if [ (_git_branch_name) ]
    #    set git_info $green"("(_git_branch_name)""

    #    # if dirty
    #    if [ (_is_git_dirty) ]
    #        set -l dirty "$red ✗"
    #        set git_info " $git_info$dirty$green)"
    #    else
    #        set git_info " $git_info)"
    #    end
    #end

    set_color -o blue
    echo -n "["
    set_color -o green
    echo -n "$USER@$__fish_prompt_hostname "
    set_color -o blue
    echo -n (prompt_pwd)
    set_color normal

    set_color -o blue
    echo -n "]"
    set_color -o normal
    echo -n -s (__fish_git_prompt)
    set_color -o blue
    echo -n ' $ '
    set_color normal
end
