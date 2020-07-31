function checkSudo() {
    if [ "$EUID" -ne 0 ]; then 
        echo "please run as root"
        exit
    fi
}

function checkNonSudo() {
    if [ "$EUID" -eq 0 ]; then 
        echo "not run as root"
        exit
    fi
}

function isPackageInstalled() {
    if dpkg -l | grep $1 &> /dev/null; then
        return 0
    else
	    return 1
    fi
}

function tryInstall() {
    isPackageInstalled $1
    if [ $? -eq 0 ]; then
        echo "$1 installed; skip"
    else
        install $1
    fi
}

function install() {
    if [ "$EUID" -ne 0 ]; then 
        sudo apt install $1
    else
        apt install $1
    fi
}

function tryRemove() {
    isPackageInstalled $1
    if [ $? -eq 0 ]; then
        remove $1
    else
        echo "$1 not installed; skip"
    fi
}

function remove() {
    if [ "$EUID" -ne 0 ]; then 
        sudo apt remove $1
        sudo apt autoremove
    else
        apt remove $1
        apt autoremove
    fi
}

function backup() {
    if [ -e $1 ]; then 
        echo "backup $1"
        mv $1 "$1.bak.$(timestamp)"
    else
        echo "[backup] $1 not exist"
    fi
}

function changeKVConfig() {
    sed -i "s/\($2 *= *\).*/\1$3/" $1
}

function timestamp() {
  date +"%Y-%m-%d_%H-%M-%S"
}

function hint() {
    echo "[hint] next: $1"
}
