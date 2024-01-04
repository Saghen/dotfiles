if status is-interactive
    # Commands to run in interactive sessions can go here
    source (starship init fish --print-full-init | psub)
    zoxide init fish | source
    fzf_configure_bindings

    # Use search menu when pressing tab for completion
    bind \t 'complete-and-search'

    # set greeter message
    function fish_greeting
        # meme greeter
        # fortune -a | cowsay
    end
end
