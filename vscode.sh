# File mode creation mask
if [ "$(id -u)" != "0" ]; then
    umask 0077
fi

# PATH
export PATH="$PATH:$HOME"/.local/bin:/opt/bin

# Interactive shells
if [ "$PS1" ]; then

    # Simplify prompt
    export PS1='$ '

    # Aliases
    alias cp="cp -i"
    alias gdb="gdb -q"
    alias ls="ls --color=auto -F"
    alias ll="ls -F -l"
    alias mv="mv -i"
    alias rm="rm -i"

    # Environment variables
    export CC="clang"
    export CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
    export EDITOR=nano
    export FLASK_APP=application.py
    export FLASK_ENV=development
    export LANG=C
    export LANGUAGE=C.UTF-8
    export LC_ALL=C.UTF-8
    export LDLIBS="-lcrypt -lcs50 -lm"
    export VALGRIND_OPTS="--memcheck:leak-check=full --memcheck:show-leak-kinds=all --memcheck:track-origins=yes"

    # History
    # https://www.shellhacks.com/tune-command-line-history-bash/
    shopt -s histappend  # Append Bash Commands to History File
    export PROMPT_COMMAND='history -a'  # Store Bash History Immediately
    shopt -s cmdhist  # Use one command per line

    # make
    make () {
        local args=""
        local invalid_args=0

        for arg; do
            case "$arg" in
                (*.c) arg=${arg%.c}; invalid_args=1;;
            esac
            args="$args $arg"
        done

        if [ $invalid_args -eq 1 ]; then
            echo "Did you mean 'make$args'?"
            return 1
        else
            command make -B $*
        fi
    }
fi

# cmd
