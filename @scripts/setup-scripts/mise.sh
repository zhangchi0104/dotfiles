#!/bin/bash
set -e

# Detect OS and install mise accordingly
install_mise() {
    local os_type
    os_type="$(uname -s)"

    case "$os_type" in
        Darwin)
            echo "Detected macOS. Installing mise via Homebrew..."
            if ! command -v brew &> /dev/null; then
                echo "Error: Homebrew is not installed. Please install Homebrew first."
                echo "Visit: https://brew.sh"
                exit 1
            fi
            brew install mise
            ;;
        Linux)
            echo "Detected Linux. Installing mise via install script..."
            curl https://mise.run | sh
            ;;
        *)
            echo "Error: Unsupported operating system: $os_type"
            echo "mise installation is only supported on macOS and Linux."
            exit 1
            ;;
    esac

    echo "mise installed successfully!"
}

install_mise
