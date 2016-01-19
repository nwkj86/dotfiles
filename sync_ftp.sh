_HOST=10.10.10.10

read -s -p "Password for $USER: " PASS
echo
#read -s -p "Password for public: " public_pass
#echo

notify-send "Syncing 'BigDisk'."

lftp \
  -e 'mkdir -p -f BigDisk_backup; \
      cd BigDisk_backup; \
      lcd BigDisk; \
      mirror  --verbose --parallel=1 --reverse --delete .; \
      exit;' \
  -u $USER,$PASS $_HOST \

notify-send "Syncing done."
#notify-send "Syncing 'public'."

#lftp \
#  -e 'cd Wideo; \
#      mirror  --verbose --parallel=1 --reverse --delete Storage/Wideo/Seriale; \
#      mirror  --verbose --parallel=1 --reverse --delete Storage/Wideo/Filmy; \
#      mirror  --verbose --parallel=1 --reverse --delete Storage/Wideo/Inne; \
#      exit;' \
#  -u public,$public_pass $_HOST \


notify-send "Syncing done."
