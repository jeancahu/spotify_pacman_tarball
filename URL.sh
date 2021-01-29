
#!/bin/bash

DFILE="$(
printf 'http://repository.spotify.com/pool/non-free/s/spotify-client/'

curl -s 'http://repository.spotify.com/pool/non-free/s/spotify-client/' |
    grep spotify-client | cut -f 2 --delimiter='"' | grep 'amd64' | tail -n 1
     )"

echo $DFILE

wget -O data.deb "$DFILE" || exit 1

exit 0
