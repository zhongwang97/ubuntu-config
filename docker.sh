source $(dirname "$0")/utils.sh

checkSudo

read -p "install docker, continue? [yn] " yn
if [[ ${yn} != "y" ]]
then
    echo "exit..."
    exit
fi

install docker.io
# 因为.的存在，tryInstall容易错误匹配，此处直接install

systemctl enable docker
usermod -aG docker ${SUDO_USER}

mkdir -p /etc/docker
cat>/etc/docker/daemon.json<<EOF
{
    "registry-mirrors": [
        "https://sc5nvmqa.mirror.aliyuncs.com"
    ]
}
EOF

cat>>/home/${SUDO_USER}/.zshrc<<EOF
alias di="docker images"
alias dc="docker container ls -as"
alias dr="docker rm"
alias dri="docker rmi"

autoload -U compinit && compinit
EOF

hint "reboot to enable docker"
hint "setup ss"
