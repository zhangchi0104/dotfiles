_load_android_home() {
    case "$OSTYPE" in
      darwin*) export ANDROID_HOME="$HOME/Library/Android/sdk" ;;
      linux*)  export ANDROID_HOME="$HOME/Android/sdk"  ;;
    esac
    unfunction _load_android_home
}

_load_android_home
