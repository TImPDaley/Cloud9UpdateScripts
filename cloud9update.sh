#!/bin/bash
# Script for building latest RUBY and RUBY on Rails environment
# 
# Show what Version of Linux is running
linuxversion=$(lsb_release -a)
echo "The current version of linux is : $linuxversion" 
echo
echo "Running apt-get update"
sudo apt-get update
echo "FINISHED WITH updating apt-get"
echo
# echo "update Ruby Version Manager - rvm "
# echo 
# rvm get stable
# # next command makes sure we reload the updated version into this shell
# rvm reload
# echo "FINISHED updating rvm"

# # REMOVE OLD VERSION OF RUBY
# rvmcurrent=$(rvm current)
# echo "The current ruby verson is $rvmcurrent"
# echo "removing that version"
# rvm remove $rvmcurrent
# echo "FINISHED removing old ruby version $rvmcurrent"
# echo

# # Get Ruby Version to install 
# echo "go google [ruby latest version] and hit enter when finished "
# read junkanswer
# # go google 'ruby latest version' 
# # click on DOWNLOAD RUBY … look for latest version
# # example 3.1.0 and enter it into the following command
# echo "Enter the latest Ruby Version: in n.n.n format"
# read rubyversion
# echo "The ruby Version we will install is : $rubyversion"
# rvm install $rubyversion
# # Change the default RVM version
# rvm --default use  $rubyversion
# # check the version 
# echo "The current ruby version is :"
# ruby -v

# UPDATE ALL GEMS
echo "Update all the GEMS"
echo ">>>>>>>>>>>>>>>"
gem update --system
echo
echo "FINISHED UPDATING GEMS"
echo ">>>>>>>>>>>>>>>"
echo
echo "Install Bundler"
echo ">>>>>>>>>>>>>>>"
gem install bundler
echo "FINISHED INSTALLING BUNDLER"
echo ">>>>>>>>>>>>>>>"
echo

# NVM Updates
echo
echo "NVM >>>>>>>>>>>>>>>"
echo "nvm version is :"
nvm --version
echo "Node is version :"
nvm ls 
echo
echo "END NVM >>>>>>>>>>>>>>>"

# INSTALL RAILS 
echo "Install Ruby on Rails >>>>>>>>>>>>>>>"
gem install rails
echo 
echo "Rails version installed >> :"
rails -v

# INSTALL Heroku Tool belt
echo "Install HEROKU Tool Belt >>>>>>>>>>>>>>>"
sudo snap install --classic heroku
sudo snap refresh heroku
echo
echo "FINISHED WITH HEROKU TOOL BELT >>>>>>>>>>>>>>>>>"
echo "Version is :"
heroku -v
## Login to Heroku with 'heroku login -i' command enter username and password
##
echo
# NOW install POSTGRES database 
echo "Install Postgres database >>>>>>>>>>>>>>>"
echo "Create the file repository configuration:"
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
echo "Import the repository signing key:"
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "Update the package list:"
sudo apt-get update
echo "Install the latest version of PostgreSQL."
sudo apt-get -y install postgresql
echo
echo "Postgres version is :"
psql --version
echo
echo "Install Postgres libpq-dev package "
sudo apt install libpq-dev
echo
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Red='\033[0;31m'          # Red
Color_Off='\033[0m'       # Text Reset
echo -e  "${Red}>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "NEXT YOU NEED TO MANUALLY ENTER THE FOLLOWING COMMANDS TO CREATE A USER NAMED ubuntu"
echo -e "WITH SU CRIDENTIALS FOR APPLICATION TO USE${Color_Off}"
echo -e "${Yellow}COMMANDS TO ENTER >>${Color_Off}"
echo "sudo su - postgres"
echo "psql"
echo "\du"
echo -e "${Blue}### IT SHOULD DISPLAY DATABASE ROLES AND USERS${Color_Off}"
echo
echo "CREATE USER ubuntu WITH PASSWORD 'YourChoiceOfPassword';"
echo -e "${Yellow}### NOTE: The password [YourChoiceOfPassword] is the same one you use in the application db config file${Color_Off}"
echo "ALTER USER ubuntu with SUPERUSER;"
echo "\du"
echo -e "${Blue}### IT SHOULD DISPLAY DATABASE ROLES AND USERS with ubuntu user as Superuser${Color_Off}"
echo
echo "\q"
echo "exit"
echo -e  "${Red}### THAT IS IT >>> YOUR DONE  >>>>>>>>>>>>>>>>>>>>>${Color_Off}"
