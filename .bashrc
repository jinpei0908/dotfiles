alias ls='ls -G'
alias clang-fmt='clang-format -style="{BasedOnStyle: llvm, IndentWidth: 4}" -i'
alias julia='/Applications/Julia-1.1.app/Contents/Resources/julia/bin/julia'

set -o vi
set -o ignoreeof

source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
source /opt/homebrew/etc/bash_completion.d/brew

function total_orico {
    grep '本人' |
    cut -f 5 |
    sed 's/,//' |
    sed 's/円//' |
    awk 'BEGIN { sum = 0 } { sum += $1 } END { print sum }'
}

function total_sumishin {
    sed 's/\([0-9]\),\([0-9]\)/\1\2/g' | tr -d '"' | tr , "\t" | cut -f 1-5
}

function total_sbi_shoken {
    sed -ne '9,$P' | grep -v '^$' | sed "s/,/`printf '\t'`/g" | sed 's/"//g'
}

function pass_gen {
    cat /dev/urandom |
        base64 |
        tr -d '+/' |
        fold -w ${1:-10} |
        head -n 1
}

function switch_hosts {
    local -r HOST_ROOT='/private/etc/hosts'
    local -r hosts_suffix="$1"

    # 引数がないとき現在のhostsがどれなのかを表示する
    if [[ "$hosts_suffix" == "" ]]; then
        for hosts_file in $(ls "$HOST_ROOT".*); do
            [[ $(diff "$hosts_file" "$HOST_ROOT") == '' ]] \
                && sed "s:$HOST_ROOT.::" <(echo "$hosts_file") \
                && return
        done
    fi
    sudo cp "$HOST_ROOT"."$hosts_suffix" "$HOST_ROOT"
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

