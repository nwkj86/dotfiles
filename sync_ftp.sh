_HOST=10.1.1.1

read -s -p "Password for artur: " artur_pass
echo
#read -s -p "Password for public: " public_pass
#echo

notify-send "Syncing 'artur'."

lftp \
  -e 'mirror  --verbose --parallel=1 --reverse --delete BigDisk/Zdjęcia; \
      mirror  --verbose --parallel=1 --reverse --delete BigDisk/home_backup; \
      mirror  --verbose --parallel=1 --reverse --delete BigDisk/Różne; \
      mirror  --verbose --parallel=1 --reverse --delete BigDisk/Muzyka; \
      mirror  --verbose --parallel=1 --reverse --delete BigDisk/Android/APKs; \
      mirror  --verbose --parallel=1 --reverse --delete BigDisk/Android/clockworkmod; \
      exit;' \
  -u artur,$artur_pass $_HOST \

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
