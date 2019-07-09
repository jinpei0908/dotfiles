alias ls='ls -G'
alias clang-fmt='clang-format -style="{BasedOnStyle: llvm, IndentWidth: 4}" -i'
alias julia='/Applications/Julia-1.1.app/Contents/Resources/julia/bin/julia'

set -o vi
set -o ignoreeof

source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash

function pass_gen {
    cat /dev/urandom |
        base64 |
        tr -d '+/' |
        fold -w ${1:-10} |
        head -n 1
}

