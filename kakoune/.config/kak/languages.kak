
# Language specific options

# Align with spaces
hook global WinCreate .* %{
    set-option window aligntab false
}

# C/Cpp
hook global WinSetOption filetype=(c|cpp) %{
    set-option window formatcmd 'clang-format'
}

# Rust
hook global WinSetOption filetype=rust %{
    set window formatcmd 'rustfmt'
}

# Makefile
hook global BufCreate .*\.mk$ %{
    set-option buffer filetype makefile
}

# Kakscript
hook global WinSetOption filetype=kak %{
    hook global NormalIdle .* %{ try %{
        execute-keys -draft -save-regs '' <a-i>w"ay
        echo -markup "{rgb:%reg{a}}██"
    }}
}

# Assembly
hook global WinSetOption filetype=gas %{
    remove-highlighter window/whitespace
    set-option window comment_line '#'
}

# Extra Highlightings
## sh
add-highlighter shared/sh/perl region "perl [^']*'" "'" ref perl/code

## C Cpp Rust Java
evaluate-commands %sh{
    for filetype in c cpp rust java; do
        printf "%s\n" "add-highlighter shared/$filetype/code/functions    regex (\w*?)\b(for|if|while)?(\h+)?(?=\() 1:function
                       add-highlighter shared/$filetype/code/struct_field regex ((?<!\.\.)(?<=\.)|(?<=->))[a-zA-Z](\w+)?\b(?![>\"\(]) 0:rgb:fb4934,default+b
                       add-highlighter shared/$filetype/code/method       regex ((?<!\.\.)(?<=\.)|(?<=->))[a-zA-Z](\w+)?(\h+)?(?=\() 0:function
                       add-highlighter shared/$filetype/code/return       regex \breturn\b 0:rgb:fb4934,default+b"
    done
    for filetype in c cpp; do
        printf "%s\n" "add-highlighter shared/$filetype/code/types_1 regex \b(v|u|vu)\w+(8|16|32|64)(_t)?\b 0:type
                       add-highlighter shared/$filetype/code/types_2 regex \b(v|u|vu)?(_|__)?(s|u)(8|16|32|64)(_t)?\b 0:type
                       add-highlighter shared/$filetype/code/types_3 regex \b(v|u|vu)(_|__)?(int|short|char|long)(_t)?\b 0:type
                       add-highlighter shared/$filetype/code/types_4 regex \b\w+_t\b 0:type"
    done
    for filetype in cpp rust; do
        printf "%s\n" "add-highlighter shared/$filetype/code/  regex [a-zA-Z](\w+)?(\h+)?(?=::) 0:rgb:be8019,default"
    done
}
