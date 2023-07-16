if status is-interactive
    # Commands to run in interactive sessions can go here
end

abbr cat 'bat'
abbr grep 'rg'
abbr find 'fd'
abbr vim 'nvim'

abbr l 'exa --icons --git-ignore'
abbr ls 'exa --icons'
abbr la 'exa -a --icons'
abbr ll 'exa -al --git --icons'
abbr lt 'exa -al -T -L=3 -I="node_modules|.git|.cache|.venv"  --icons'
