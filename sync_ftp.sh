_HOST=10.1.1.1

read -s -p "Password for artur: " artur_pass
echo
read -s -p "Password for public: " public_pass
echo

lftp \
  -e 'mirror  --verbose --parallel=1 --reverse --delete BigDisk/Zdjęcia; \
      mirror  --verbose --parallel=1 --reverse --delete BigDisk/home_backup; \
      mirror  --verbose --parallel=1 --reverse --delete BigDisk/Różne; \
      mirror  --verbose --parallel=1 --reverse --delete BigDisk/Muzyka; \
      exit;' \
  -u artur,$artur_pass $_HOST \

lftp \
  -e 'cd Wideo; \
      mirror  --verbose --parallel=1 --reverse --delete Storage/Wideo/Seriale; \
      mirror  --verbose --parallel=1 --reverse --delete Storage/Wideo/Filmy; \
      exit;' \
  -u public,$public_pass $_HOST \
