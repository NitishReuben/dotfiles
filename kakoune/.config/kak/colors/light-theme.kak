# custom light-theme

evaluate-commands %sh{
    black="rgb:927f70"
    gray="rgb:6d767d"
    lightgray="rgb:e6eaed"
    white="rgb:fffff7"

    pink="rgb:ff549b"
    purple="rgb:d3869b"
    blue="rgb:7daea3"
    cyan="rgb:89b482"
    green="rgb:a9b665"
    yellow="rgb:d8a657"
    orange="rgb:e78a4e"
    red="rgb:ea6962"

    echo "
         face global value $green
         face global type $purple
         face global variable $red
         face global function $red
         face global module $red
         face global string $yellow
         face global error $red
         face global keyword $cyan
         face global operator $orange
         face global attribute $pink
         face global comment $blue
         face global meta $red
         face global builtin $black

         face global title $red
         face global header $orange
         face global mono $green
         face global block $cyan
         face global link $green
         face global bullet $green
         face global list $gray

         face global Default $gray,$white

         face global PrimarySelection $black,$pink
         face global PrimaryCursor $black,$blue
         face global PrimaryCursorEol $black,$blue

         face global SecondarySelection $black,$purple
         face global SecondaryCursor $black,$orange
         face global SecondaryCursorEol $black,$orange

         face global MatchingChar $black,$cyan
         face global Search $blue,$green
         face global CurrentWord $gray,$lightgray

         # listchars
         face global Whitespace $lightgray,$white+f
         # ~ lines at EOB
         face global BufferPadding $lightgray,$white
         # must use wrap -marker hl
         face global WrapMarker Whitespace

         face global LineNumbers $gray,$white
         # must use -hl-cursor
         face global LineNumberCursor $black,$white+b
         face global LineNumbersWrapped $gray,$white+i

         # when item focused in menu
         face global MenuForeground $blue,$white+b
         # default bottom menu and autocomplete
         face global MenuBackground $white,$blue
         # complement in autocomplete like path
         face global MenuInfo $lightgray,$blue
         # clippy
         face global Information $yellow,$lightgray
         face global Error $black,$red

         # all status line: what we type, but also client@[session]
         face global StatusLine $black,$white
         # insert mode, prompt mode
         face global StatusLineMode $white,$green
         # message like '1 sel'
         face global StatusLineInfo $purple,$white
         # count
         face global StatusLineValue $orange,$white
         face global StatusCursor $white,$blue
         # like the word 'select:' when pressing 's'
         face global Prompt $white,$green
    "
}
