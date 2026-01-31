load_applications() {
    local application_dir=$__ZSH_CONFIG_HOME/applications
    include "$application_dir/1password.zsh"
    include "$application_dir/starship.zsh"
    include "$application_dir/zoxide.zsh"
    include "$application_dir/mise.zsh"
    unfunction load_applications 2>/dev/null
}

load_applications
