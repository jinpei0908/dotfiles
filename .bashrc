# aliases
alias ls='ls -G'

# bash setting
set -o vi
set -o ignoreeof

# completion files
# git
source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
# bash_completion.d
for completion_file in $(ls /opt/homebrew/etc/bash_completion.d/*); do
    source "$completion_file"
done

# my functions
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
