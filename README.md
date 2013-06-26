dragon-dev
==========

Note: Still a work-in-progress. not ready for prime time.

A quick-deploy dev environment using up-to-date tools, using the power of Vagrant and Chef

Installation guide:
-----------

* Grab the latest version of Vagrant: http://downloads.vagrantup.com/
* Install git:
    + Windows: http://code.google.com/p/msysgit/downloads/list?q=full+installer+official+git
    + Mac: I recommend Homebrew, simple 3 step process
        Install homebrew, via terminal: `ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"`  
        Install Mac Command Line Tools: http://connect.apple.com (requires registration)  
        Install git, via terminal: `brew install git`
    + Linux: use your repos (e.x. `apt-get install git` on ubuntu)
* Git clone this repo
    + Windows users: the version of Git above allows you to type git commands directly into the windows command prompt
* Set up librarian
    + run `gem install librarian-chef`  note: this will take a few minutes
    + run `librarian-chef install`
* In your terminal/prompt window, in the repo directory, type `vagrant up`
* After the automated install completes, type `vagrant ssh` and you're in!

To Do:
-----------
* Migrate shell script to chef
* change from headless ubuntu box to full x-based interface for IDE and other gui based tools.
