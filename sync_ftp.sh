_USER=artur
_HOST=10.1.1.1

echo "Syncing home dir to $_USER@$_HOST... [Press ENTER]"
read

lftp \
  -e 'mirror  --verbose --parallel=2 --reverse --delete BigDisk/Zdjęcia; \
      mirror  --verbose --parallel=2 --reverse --delete BigDisk/home_backup; \
      mirror  --verbose --parallel=2 --reverse --delete BigDisk/Różne; \
      mirror  --verbose --parallel=2 --reverse --delete BigDisk/Muzyka; \
      exit;' \
  -u $_USER $_HOST \

_USER=public
echo "Syncing Storage/Wideo/{Seriale,Filmy} with $_USER@$_HOST... [Press ENTER]"
read

lftp \
  -e 'cd Wideo; \
      mirror  --verbose --parallel=2 --reverse --delete Storage/Wideo/Seriale; \
      mirror  --verbose --parallel=2 --reverse --delete Storage/Wideo/Filmy; \
      exit;' \
  -u $_USER $_HOST \
