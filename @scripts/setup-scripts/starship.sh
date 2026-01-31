#!/bin/bash
set -e

# Detect OS and install Starship accordingly
install_starship() {
    local os_type
    os_type="$(uname -s)"

    case "$os_type" in
        Darwin)
            echo "Detected macOS. Installing Starship via Homebrew..."
            if ! command -v brew &> /dev/null; then
                echo "Error: Homebrew is not installed. Please install Homebrew first."
                echo "Visit: https://brew.sh"
                exit 1
            fi
            brew install starship
            ;;
        Linux)
            echo "Detected Linux. Installing Starship via install script..."
            curl -sS https://starship.rs/install.sh | sh
            ;;
        *)
            echo "Error: Unsupported operating system: $os_type"
            echo "Starship installation is only supported on macOS and Linux."
            exit 1
            ;;
    esac

    echo "Starship installed successfully!"
}

install_starship
