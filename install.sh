#!/usr/bin/env bash

set -eo pipefail

msg() {
    printf '%b\n' "$1" >&2
}

success() {
    if [ "$ret" -eq '0' ]; then
        msg "\33[32m[✔]\33[0m ${1}${2}"
    fi
}

error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
}

exists() {
    command -v "$1" >/dev/null 2>&1
}

install_plugins() {
    for exe in "$@"; do
        eval "$exe +PlugInstall +qall"
    done
    ret="$?"
    success "Successfully installed plugins via vim-plug"
}

backup() {
    if [ -e "$1" ]; then
        echo
        msg "\033[1;34m==>\033[0m Attempting to back up your original vim configuration"
        today=$(date +%Y%m%d_%s)
        mv -v "$1" "$1.$today"

        ret="$?"
        success "Your original vim configuration has been backed up"
    fi
}

install_for_vim() {
    backup "$HOME/.vimrc"

    cp init.vim "$HOME/.vimrc"
    cp -rf autoload "$HOME/.vim"
    cp -rf colors "$HOME/.vim"
    cp -rf ftdetect "$HOME/.vim"
    cp -r ftplugin "$HOME/.vim"
    cp -rf init "$HOME/.vim"
    cp -rf plugin "$HOME/.vim"
    cp -rf tools "$HOME/.vim"
    install_plugins "vim"
}

install_for_neovim() {
    backup "$HOME/.config/nvim/init.vim"

    mkdir -p "$HOME/.config/nvim"
    cp init.vim "$HOME/.config/nvim/init.vim"
    cp -rf autoload "$HOME/.vim"
    cp -rf colors "$HOME/.vim"
    cp -rf ftdetect "$HOME/.vim"
    cp -r ftplugin "$HOME/.vim"
    cp -rf init "$HOME/.vim"
    cp -rf plugin "$HOME/.vim"
    cp -rf tools "$HOME/.vim"
    install_plugins "nvim"
}

check_git() {
    if ! exists "git"; then
        error "You must have 'git' installed to continue"
    fi
}

install() {
    if exists "vim" && exists "nvim"; then
        echo "\033[1;34m==>\033[0m Find both 'vim' and 'nvim' in your system"
        echo
        while true; do
            read -r -p "    Install space-vim for: [0]vim [1]nvim [2]vim and nvim :" opt
            case $opt in
                0)
                    install_for_vim
                    break
                    ;;
                1)
                    install_for_neovim
                    break
                    ;;
                2)
                    install_for_vim
                    install_for_neovim
                    break
                    ;;
                *)
                    echo "Please answer 0, 1 or 2"
                    ;;
            esac
        done
    elif exists "vim"; then
        msg "\033[1;34m==>\033[0m Only find 'vim' in your system"
        msg "    Starting to install space-vim for 'vim'"
        install_for_vim
    elif exists "nvim"; then
        msg "\033[1;34m==>\033[0m Only find 'nvim' in your system"
        msg "    Starting to install space-vim for 'nvim'"
        echo
        install_for_neovim
    else
        error "You must have 'vim' or 'nvim' installed to continue"
    fi
}

###############################
##  main
###############################
check_git

install

msg "\nThanks for installing \033[1;31m$app_name\033[0m. Enjoy!"

