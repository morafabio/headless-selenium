#!/usr/bin/env bash
source "/vagrant/scripts/_shared.sh" $0

SELENIUM_URL="http://selenium-release.storage.googleapis.com/2.42/selenium-server-standalone-2.42.2.jar"
FIREFOX_URL="https://download.mozilla.org/?product=firefox-31.0-SSL&os=linux64&lang=en-US"

SELENIUM_DIR=/opt/selenium-grid
SELENIUM_DRIVERS=$SELENIUM_DIR/drivers
SELENIUM_CONFIG=$files/selenium-grid
INIT_SCRIPT=/etc/init.d/selenium-grid

_ensure_directory () {
    if [ ! -d $1 ];
    then
        mkdir -p $1
    fi
}

_download_selenium () {
    SELENIUM_JAR=$SELENIUM_DIR/$(basename "$SELENIUM_URL")
    if [ ! -f $SELENIUM_JAR ];
    then
        wget $SELENIUM_URL -O $SELENIUM_JAR
    fi
}

_setup_firefox () {
    apt-get -y -q install libasound2 libdbus-glib-1-2
    wget $FIREFOX_URL -O - | tar -xj -C /opt/

    if [ -a /usr/bin/firefox ]
    then
    	rm -f /usr/bin/firefox
    fi

    ln -s /opt/firefox/firefox /usr/bin/firefox
}

_setup_phantomjs () {
    npm install -g webdriverjs
    npm install -g phantomjs
}

_configure_init () {
    apt-get -y -q install imagemagick

    cp $SELENIUM_CONFIG/node.json $SELENIUM_DIR/
    cp $SELENIUM_CONFIG/hub.json $SELENIUM_DIR/
    
    cp $SELENIUM_CONFIG$INIT_SCRIPT $INIT_SCRIPT
    
    chmod a+x $INIT_SCRIPT
    update-rc.d $(basename "$INIT_SCRIPT") defaults
}

# Run
_ensure_directory $SELENIUM_DIR
_ensure_directory $SELENIUM_DRIVERS

_download_selenium

_setup_firefox
_setup_phantomjs

_configure_init

# Start
$INIT_SCRIPT stop
$INIT_SCRIPT start

exit 0
