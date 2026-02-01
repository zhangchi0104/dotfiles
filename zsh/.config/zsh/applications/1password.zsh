_set_ssh_auth_sock() {
    # Skip if in SSH session (SSH_AUTH_SOCK is forwarded from client)
    [[ -n "$SSH_CONNECTION" ]] && return

    case "$OSTYPE" in
        darwin*)
            export SSH_AUTH_SOCK="${HOME}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
            ;;
        linux*)
            export SSH_AUTH_SOCK="${HOME}/.1password/agent.sock"
            ;;
    esac
    unfunction _set_ssh_auth_sock 2>/dev/null
}

_set_ssh_auth_sock
