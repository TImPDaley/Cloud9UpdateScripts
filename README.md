# Cloud9UpdateScripts
Scripts to automatically update a new Cloud9 server for Ruby on Rails v 7 and install postgres

Create a new machine - IMPORTANT >>>> choose "Ubuntu Server 18.04 LTS"

clone this repository into new machine then move the cloud9updat.sh file to top directory and run it from bash shell with 

Update RVM with this command 
$rvm get stable

reload rvm
$rvm reload

See current loaded ruby versions with this command
$rvm list

Delete old versions with 
$rvm remove n.n.n

NOW INSTALL LATEST version of Ruby (google latest ruby version :-) 
$ rvm install n.n.n

Make sure it is the default by checking 
$rvm list
If it is not then use this command to set default
$rvm --default use n.n.n

NOW run this script
$bash cloud9update.sh 

it will ask for you to google the latest version of ruby 

then enter it in the script (example 3.1.0 )... 

then it will install 
