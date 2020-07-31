source $(dirname "$0")/utils.sh

read -p "Please ensure oh-my-zsh installed: [yn] " yn
if [[ ${yn} != "y" ]]; then
    echo "install oh-my-zsh first"
    exit
fi

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

zshrc="$HOME/.zshrc"

backup ${zshrc}
cat>${zshrc}<<EOF
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="mortalscumbag"
#ZSH_THEME="jnrowe"
#ZSH_THEME="robbyrussell"
#ZSH_THEME="avit"
#ZSH_THEME="bureau"
#ZSH_THEME="michelebologna"

plugins=(git colored-man-pages autojump zsh-syntax-highlighting fzf fancy-ctrl-z docker docker-compose)

source $ZSH/oh-my-zsh.sh

alias cl="clear"

setopt no_nomatch
EOF

hint "setup docker"
