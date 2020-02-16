alias ls='ls -G'
alias clang-fmt='clang-format -style="{BasedOnStyle: llvm, IndentWidth: 4}" -i'
alias julia='/Applications/Julia-1.1.app/Contents/Resources/julia/bin/julia'

set -o vi
set -o ignoreeof

source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/brew

function pass_gen {
    cat /dev/urandom |
        base64 |
        tr -d '+/' |
        fold -w ${1:-10} |
        head -n 1
}

function switch_hosts {
    hosts_kind="$1"
    hosts_kind=${hosts_kind:? "is missing"}
    sudo cp /private/etc/hosts."$hosts_kind" /private/etc/hosts
}

function _switch_hosts_completion {
    local opts=$(ls /private/etc/hosts.* | sed 's:/private/etc/hosts.::')
    local cur
    _get_comp_words_by_ref -n: cur
    COMPREPLY=( $( compgen -W "$opts" -- "$cur" ) )
}

complete -F _switch_hosts_completion switch_hosts

function _make_completion {
    local opts=$(grep -v "\t" Makefile |
        grep -v ".PHONY" |
        sed -e "s/:.*$//g" -e "/^$/d")
    local cur
    _get_comp_words_by_ref -n: cur
    COMPREPLY=( $( compgen -W "$opts" -- "$cur" ) )
}

complete -F _make_completion make

