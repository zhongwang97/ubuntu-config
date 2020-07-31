source $(dirname "$0")/utils.sh

checkSudo

backup /etc/apt/sources.list
cat>>/etc/apt/sources.list<<EOF
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse
EOF

cat>>/etc/hosts<<EOF
151.101.192.133 raw.github.com
151.101.128.133 raw.githubusercontent.com
192.30.255.117 api.github.com
EOF

apt update

tryInstall vim
tryInstall git
tryInstall zsh
tryInstall screenfetch
tryInstall dnsutils
tryInstall silversearcher-ag
tryInstall tree
tryInstall autojump
tryInstall htop
tryInstall build-essential
tryInstall gdb
tryInstall gawk
tryInstall software-properties-common
tryInstall unzip
tryInstall smartmontools
tryInstall lshw
tryInstall fzf

#tryInstall glances
tryInstall traceroute

hint 'sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
hint "setup ohmyzsh"


