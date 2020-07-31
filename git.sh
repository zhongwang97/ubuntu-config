read -p "set gitconfig, confirm? [yn] " yn
if [[ ${yn}  != "y" ]]; then
    exit
fi

source $(dirname "$0")/utils.sh

gitConfigFile="$HOME/.gitconfig"

backup ${gitConfigFile}
cat>${gitConfigFile}<<EOF
[user]
	email = zhongwang97@gmail.com
	name = zhongwang97
[core]
	editor = vim
EOF