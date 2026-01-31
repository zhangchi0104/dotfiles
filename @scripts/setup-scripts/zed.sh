#!/bin/bash
set -e

# Detect OS and install Zed accordingly
install_zed() {
    local os_type
    os_type="$(uname -s)"

    case "$os_type" in
        Darwin)
            echo "Detected macOS. Installing Zed via Homebrew..."
            if ! command -v brew &> /dev/null; then
                echo "Error: Homebrew is not installed. Please install Homebrew first."
                echo "Visit: https://brew.sh"
                exit 1
            fi
            brew install --cask zed
            ;;
        Linux)
            echo "Detected Linux. Installing Zed via install script..."
            curl -f https://zed.dev/install.sh | sh
            ;;
        *)
            echo "Error: Unsupported operating system: $os_type"
            echo "Zed installation is only supported on macOS and Linux."
            exit 1
            ;;
    esac

    echo "Zed installed successfully!"
}

install_zed
