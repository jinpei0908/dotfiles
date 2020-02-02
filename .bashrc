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

