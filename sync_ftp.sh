lftp \
  -e 'mirror  --verbose --parallel=2 --reverse --delete BigDisk/Zdjęcia; \
      mirror  --verbose --parallel=2 --reverse --delete BigDisk/home_backup; \
      mirror  --verbose --parallel=2 --reverse --delete BigDisk/Różne; \
      mirror  --verbose --parallel=2 --reverse --delete BigDisk/Muzyka; \
      exit;' \
  -u artur,tonieto32a  10.1.1.1

