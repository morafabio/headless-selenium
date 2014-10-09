#!/usr/bin/env bash
source "/vagrant/scripts/_shared.sh" $0

VAGRANT_CONFIG=$files/Xvfb
INIT_SCRIPT=/etc/init.d/Xvfb

# Install Xvfb
apt-get -y -q install xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic
apt-get -y -q install xvfb

# Configure init.d
cp $VAGRANT_CONFIG$INIT_SCRIPT $INIT_SCRIPT
chmod a+x $INIT_SCRIPT
update-rc.d $(basename "$INIT_SCRIPT") defaults

# Start daemon
$INIT_SCRIPT start

exit 0
