#!/bin/bash
set -e

# Detect OS and install Ghostty accordingly
install_ghostty() {
    local os_type
    os_type="$(uname -s)"

    case "$os_type" in
        Darwin)
            echo "Detected macOS. Installing Ghostty via Homebrew..."
            if ! command -v brew &> /dev/null; then
                echo "Error: Homebrew is not installed. Please install Homebrew first."
                echo "Visit: https://brew.sh"
                exit 1
            fi
            brew install --cask ghostty
            ;;
        Linux)
            # Check if running Ubuntu
            if [ -f /etc/os-release ]; then
                . /etc/os-release
                if [ "$ID" = "ubuntu" ]; then
                    echo "Detected Ubuntu. Installing Ghostty via install script..."
                    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"
                else
                    echo "Error: Unsupported Linux distribution: $ID"
                    echo "Ghostty installation is only supported on Ubuntu for Linux."
                    echo "Please check https://ghostty.org for other installation options."
                    exit 1
                fi
            else
                echo "Error: Cannot detect Linux distribution."
                echo "Ghostty installation is only supported on Ubuntu for Linux."
                echo "Please check https://ghostty.org for other installation options."
                exit 1
            fi
            ;;
        *)
            echo "Error: Unsupported operating system: $os_type"
            echo "Ghostty installation is only supported on macOS and Ubuntu Linux."
            exit 1
            ;;
    esac

    echo "Ghostty installed successfully!"
}

install_ghostty
