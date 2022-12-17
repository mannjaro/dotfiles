if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source

abbr -a cat bat
abbr -a ls exa --icons
abbr -a la exa --icons -haF
abbr -a ll exa --icons -halF --git
abbr -a lt exa --icons --tree --level=3
abbr -a grep rg
abbr -a find fd
abbr -a vim nvim

