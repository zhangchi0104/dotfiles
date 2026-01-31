#!/bin/bash
set -e

install_1password_macos() {
    echo "Detected macOS. Installing 1Password via Homebrew..."
    if ! command -v brew &> /dev/null; then
        echo "Error: Homebrew is not installed. Please install Homebrew first."
        echo "Visit: https://brew.sh"
        exit 1
    fi
    brew install --cask 1password 1password-cli
}

install_1password_linux() {
    echo "Detected Linux. Installing 1Password via apt..."

    echo "Adding 1Password GPG key..."
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
        sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg

    echo "Adding 1Password apt repository..."
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" | \
        sudo tee /etc/apt/sources.list.d/1password.list

    echo "Adding debsig-verify policy..."
    sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
    curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | \
        sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
    sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
        sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg

    echo "Installing 1Password and 1Password CLI..."
    sudo apt update && sudo apt install -y 1password-cli 1password
}

install_1password() {
    local os_type
    os_type="$(uname -s)"

    case "$os_type" in
        Darwin)
            install_1password_macos
            ;;
        Linux)
            install_1password_linux
            ;;
        *)
            echo "Error: Unsupported operating system: $os_type"
            echo "1Password installation is only supported on macOS and Linux."
            exit 1
            ;;
    esac

    echo "1Password installed successfully!"
}

install_1password
