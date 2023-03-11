if status is-interactive
    fish_vi_key_bindings
    starship init fish | source
    
    set -g fish_greeting
    set -gx EDITOR hx
end


