#!/bin/bash
set -e

# Detect OS and install opencode accordingly
install_opencode() {
    local os_type
    os_type="$(uname -s)"

    case "$os_type" in
        Darwin)
            echo "Detected macOS. Installing opencode via Homebrew..."
            if ! command -v brew &> /dev/null; then
                echo "Error: Homebrew is not installed. Please install Homebrew first."
                echo "Visit: https://brew.sh"
                exit 1
            fi
            brew install anomalyco/tap/opencode
            ;;
        Linux)
            echo "Detected Linux. Installing opencode via install script..."
            curl -fsSL https://opencode.ai/install | bash
            ;;
        *)
            echo "Error: Unsupported operating system: $os_type"
            echo "opencode installation is only supported on macOS and Linux."
            exit 1
            ;;
    esac

    echo "opencode installed successfully!"
}

install_opencode
