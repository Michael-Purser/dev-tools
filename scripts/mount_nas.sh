#!/bin/bash

# USAGE:
#   Make sure cifs-utils is installed on your system
#   Make the script executable and run it without arguments to mount NAS, or with flag -u to unmount NAS.

NAS_IP="${1:-192.168.0.122}"
NAS_MNT="${2:-/mnt/nas-evo}"
NAS_SHARES="${3:-'photos'}"
UNMOUNT="${4:-'false'}"
MNT_UID="${5:-$(id -u "${USER}")}"

# Prompt for password here already to prevent clutter in logs later
sudo echo &>/dev/null

for share in ${NAS_SHARES};
do
    smb_uri="//${NAS_IP}/${share}"
    mnt_point="${NAS_MNT}/${share}"

    if [ "${UNMOUNT}" = 'true' ];
    then
        echo "Unmounting ${mnt_point} ..."
        sudo umount "${mnt_point}" &>/dev/null
        continue
    fi

    if ! grep -qs "${smb_uri}" /proc/mounts;
    then
        if [ -z "${NAS_LOGIN}" ];
        then
            echo "NAS Login: "
            read -r NAS_LOGIN
        fi
        if [ -z "${NAS_PASSWORD}" ];
        then
            echo "NAS Password: "
            read -rs NAS_PASSWORD
            echo
        fi
        echo "Mounting ${smb_uri} to ${mnt_point} ..."
        sudo mkdir -p "${mnt_point}"
        sudo chown -R "${USER}":"${USER}" "${NAS_MNT}"
        if ! sudo mount.cifs "${smb_uri}" "${mnt_point}" -o user="${NAS_LOGIN}",uid="${MNT_UID}",vers=3.0,password=${NAS_PASSWORD};
        then
            unset NAS_PASSWORD
        fi
    fi
done
