README

Costa Rica Kids School Sponsorship Program

Software Stack

* Tested on Microsoft Windows 7+, iPad 4 mini and Google Chrome

* Java
 * install Java 8 JDK from Oracle website http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html

* jruby 9.0.4.0
 * install from http://jruby.org/download into C:\jruby-9.0.4.0

* SQLite
 * Runs as a file database. Gems will be installed to run the database.
 
* git
 * install Git for Windows https://git-scm.com/download/win
 * change directory to c:\
 * run the command "git clone https://github.com/crk2update/crk2-updates crk2" to pull down the latest source code from Github.

* Rails 4
 * change directory to c:\crk2
 * run the command "jruby -S gem install bundler" as the bundler gem has to be installed as its own step.
 * run the command "jruby -S bundle install" to pull down the dependencies.
 * run the command "jruby -S rake db:create db:migrate db:seed" to setup the development and test databases.
 * run the command "jruby -S rails server"
 * open http://localhost:3000 to see the home page of the project. Control-C the rails server to stop.
 * additional flags and commands are needed to run in production mode.
 * Set the environment variable RAILS_ENV as "RAILS_ENV=production" (this affects which database is in use amongst other things).
 * run the command "jruby -S rake secret" and use the output value below.
 * Set the environment variable SECRET_KEY_BASE as "SECRET_KEY_BASE=abc" where abc is the output value from above. This secret must be stable between runs.
 * run the command "jruby -S rake assets:precompile" to precompile assets (it sounds optional, but it is mandatory).
 * run the command "jruby -S rake db:create db:migrate db:seed" to setup the production database (observing the RAILS_ENV variable)
 * run the command "jruby -S rails server -p 80" to run with port 80
