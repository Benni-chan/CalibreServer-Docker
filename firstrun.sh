#!/bin/bash

# Check if config exists. If not, copy in the sample config
if [ -f /opt/calibre/calibre-server ]; then
  echo "Using existing install."
else
  echo "Installing Clean"
  cd /opt
  wget --no-check-certificate -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py | python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main('/opt/', True)"
fi

/opt/calibre/calibre-server --with-library /config/Library --username $CALUSER --password $CALPASSWORD --url-prefix $URLPREFIX
