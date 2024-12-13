#!/bin/bash
#
# Script command to prepare project and setup base configuration and feature you may need.
#
# Usage: ./scripts/setup.sh
#
# Created in colab with original author: André Schneider <mail@schneiderandre.com>

set -e
set -o pipefail

echo
echo "------------------------"
echo "--- Setup Project 🚀 ---"
echo "------------------------"
echo

install_mise() {
    mise_install_path="$HOME/.local/bin/mise"

    echo
    echo "--- Installing Mise ..."

    if [ -f "$mise_install_path" ]; then
        echo "Mise is already installed, skipping download."
    else
        if command -v mise &> /dev/null; then
            echo "Mise is already installed via a non-recommended way, please deinstall Mise and run the setup again."
            exit 1
        else
            make install_mise
        fi
    fi

    echo "--- Mise installed ✅"
    echo
}

activate_mise() {
    case "${SHELL:-}" in
        */zsh)
            config_file="$HOME/.zshrc"
            activation_command='eval "$(~/.local/bin/mise activate zsh)"'
            ;;
        */bash)
            config_file="$HOME/.bashrc"
            activation_command='eval "$(~/.local/bin/mise activate bash)"'
            ;;
        *)
            echo "mise: run \`$mise_install_path --help\` to get started"
            return
            ;;
    esac

    # Check if the activation command is already in the config file
    if ! grep -q "$activation_command" "$config_file"; then
        echo "$activation_command" >> "$config_file"
        echo "Added Mise activation to $config_file."
    else
        echo "Mise activation already present in $config_file."
    fi
}

install_git_hooks() {
    echo
    echo "--- Installing Git Hooks ..."
    git --git-dir="$PWD/.git" config core.hooksPath .githooks
    chmod ug+x .githooks/*
    echo "--- Git Hooks installed ✅"
    echo
}

reload_shell() {
    case "${SHELL:-}" in
        */zsh)
            exec zsh
            ;;
        */bash)
            exec bash
            ;;
        *)
            echo "Please restart your Shell."
            ;;
    esac
}

install_mise
activate_mise
install_git_hooks

echo
echo "------------------------"
echo "--- Project ready 🎉 ---"
echo "------------------------"
echo

reload_shell