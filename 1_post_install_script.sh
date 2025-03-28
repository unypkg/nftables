#!/usr/bin/env bash
# shellcheck disable=SC2034,SC1091,SC2154,SC1003

current_dir="$(pwd)"
unypkg_script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
unypkg_root_dir="$(cd -- "$unypkg_script_dir"/.. &>/dev/null && pwd)"

cd "$unypkg_root_dir" || exit

#############################################################################################
### Start of script

mkdir -pv /etc/uny
if [[ ! -s /etc/uny/nftables.conf ]]; then
    cp -a etc/nftables.conf /etc/uny/nftables.conf
fi

cp -a etc/uny-nftables.service /etc/systemd/system/uny-nftables.service
systemctl daemon-reload

#############################################################################################
### End of script

cd "$current_dir" || exit
