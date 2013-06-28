dragon-dev
==========

Note: Still a work-in-progress. not ready for prime time.

A quick-deploy dev environment using up-to-date tools, using the power of Vagrant and Chef

Installation guide:
-----------

* Grab the latest version of Vagrant: http://downloads.vagrantup.com/
* Install git:
    + Windows:  http://code.google.com/p/msysgit/downloads/list?q=full+installer+official+git
    + Mac:      http://git-scm.com/downloads
    + Linux:    http://git-scm.com/downloads or use your repos (e.x. `apt-get install git` on ubuntu)
* Git clone this repo: `git clone https://github.com/scheidm/dragon-dev.git`
    + Windows users: the version of Git above allows you to type git commands directly into the windows command prompt
* Set up librarian
    + run `gem install librarian-chef`  note: this will take a few minutes
    + run `librarian-chef install`
* In your terminal/prompt window, go to the dragon-dev directory
* Install and load your box with command `vagrant up && vagrant ssh`
* When installation completes, you will find yourself at the command prompt of your own dev-box!

To Do:
-----------
* Migrate shell script to chef
* change from headless ubuntu box to full x-based interface for IDE and other gui based tools.
