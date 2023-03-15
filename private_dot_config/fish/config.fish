if status is-interactive
    set -g fish_greeting
    fish_vi_key_bindings
    starship init fish | source

    set -gx EDITOR nvim
    set -gx SUDO_EDITOR $EDITOR
    set -gx VISUAL $EDITOR
end

