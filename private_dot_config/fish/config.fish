if status is-interactive
    set -g fish_greeting
    fish_vi_key_bindings
    starship init fish | source

    # Helix's binary on Arch is 'helix'
    if type -q helix
        set -gx EDITOR helix
        alias hx="helix"
    else
        set -gx EDITOR hx
    end

    set -gx SUDO_EDITOR $EDITOR
    set -gx VISUAL $EDITOR
end

