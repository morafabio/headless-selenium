
## Headless Selenium provisioner

This script provides a micro Selenium grid with a hub and a node, ready to accept webdrivers. Capabilities are *Firefox* and *PhantomJS*.

It's think to be used with Debian/Ubuntu and vagrant, but you can port it everywhere changing paths and package managers.

### Setup

Copy `scripts` in the same directory of your `Vagrantfile`.

- `sudo /vagrant/scripts/setup_Xvfb.sh`
- `sudo /vagrant/scripts/setup_selenium.sh`

### Daemons

- `/etc/init.d/Xvfb {start|stop|restart|status}`
- `/etc/init.d/selenium-grid {start|stop|restart|status}`

### Usage 

- Check out the web console at: http://your-host:4444/grid/console
- Register your drivers to: http://your-host:4444/wd/hub

### Credits & License

Fabio Mora - `mail@fabiomora.com`

This stuff is open and free!
