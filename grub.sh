source $(dirname "$0")/utils.sh

checkSudo

read -p "input GRUB_TIMEOUT: " t

changeKVConfig "/etc/default/grub" "GRUB_TIMEOUT" ${t}
update-grub
