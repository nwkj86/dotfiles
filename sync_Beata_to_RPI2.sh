#/usr/bin/env bash
. ~/.bashrc

#_RPI2_IP=10.1.1.10
_RPI2_IP=10.10.10.10
_SYNC_CMD="rsync -a -r --human-readable --delete --verbose --progress "
#_SYNC_CMD="rsync -a -r --human-readable --delete "
_MY_ID=beata

notify-send "Syncing 'beata'."
sync_dirs /run/media/artur2/Dane/ $_MY_ID@$_RPI2_IP:/home/$_MY_ID/backup_Dane/
sync_dirs /run/media/artur2/System/ $_MY_ID@$_RPI2_IP:/home/$_MY_ID/backup_System/

notify-send "Syncing done."
