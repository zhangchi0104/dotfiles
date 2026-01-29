precmd() { precmd() { echo } }

# Usage: include
# Warns if ".zsh" is included in the base name.
#
get_os() {
    case "$OSTYPE" in
        darwin*) echo "darwin" ;;
        linux*)  echo "linux"  ;;
        *)       echo "unknown" ;;
    esac
}

include_file_by_os() {
  local base="$1"
  local os

  if [[ "$base" == *.zsh ]]; then
    print -u2 "warning: include_module expects a base name without '.zsh': $base"
    base="${base%.zsh}"
  fi

  case "$OSTYPE" in
    darwin*) os="darwin" ;;
    linux*)  os="linux"  ;;
    *)       os=""       ;;
  esac

  if [[ -n "$os" && -f "${base}.${os}.zsh" ]]; then
    source "${base}.${os}.zsh"
  elif [[ -f "${base}.zsh" ]]; then
    source "${base}.zsh"
  fi
}


include() {
    if [ -f $1 ]; then
        source $1
    fi
}
