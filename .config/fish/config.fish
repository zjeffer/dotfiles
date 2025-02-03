bass source ~/.config/zsh/.zshenv
if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

    bind alt-backspace backward-kill-word 
end
