#!/bin/bash
set -e

install_zoxide() {
    local os_type
    os_type="$(uname -s)"

    case "$os_type" in
        Darwin)
            echo "Detected macOS. Installing zoxide via Homebrew..."
            if ! command -v brew &> /dev/null; then
                echo "Error: Homebrew is not installed. Please install Homebrew first."
                echo "Visit: https://brew.sh"
                exit 1
            fi
            brew install zoxide
            ;;
        Linux)
            echo "Detected Linux. Installing zoxide via install script..."
            curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
            ;;
        *)
            echo "Error: Unsupported operating system: $os_type"
            echo "zoxide installation is only supported on macOS and Linux."
            exit 1
            ;;
    esac

    echo "zoxide installed successfully!"
}

install_zoxide
