
typeset -A color_palette

color_palette=(
    [rosewater]="0xdc8a78"
    [flamingo]="0xdd7878"
    [pink]="0xea76cb"
    [mauve]="0x8839ef"
    [red]="0xd20f39"
    [maroon]="0xe64553"
    [peach]="0xfe640b"
    [yellow]="0xdf8e1d"
    [green]="0x40a02b"
    [teal]="0x179299"
    [sky]="0x04a5e5"
    [sapphire]="0x209fb5"
    [blue]="0x1e66f5"
    [lavender]="0x7287fd"
    [text]="0x4c4f69"
    [subtext1]="0x5c5f77"
    [subtext0]="0x6c6f85"
    [overlay2]="0x7c7f93"
    [overlay1]="0x8c8fa1"
    [overlay0]="0x9ca0b0"
    [surface2]="0xacb0be"
    [surface1]="0xbcc0cc"
    [surface0]="0xccd0da"
    [base]="0xeff1f5"
    [mantle]="0xe6e9ef"
    [crust]="0xdce0e8"
)


add_alpha() {
    local color=$1
    local alpha=$2
    echo "0x${alpha#0x}${color#0x}"
}
