set :application, "ferreteria_scabuzzo"
default_run_options[:pty] = true  # Must be set for the password prompt
                                  # from git to work
set :repository,  "git@github.com:guidocollino/licitaciones.git"
set :scm, "git"
# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#server "ferretariascabuzzo.com.ar", :app, :web, :db, :primary => true
set :user, "guido"  # The server's user for deploys
set :scm_passphrase, "pepe.luis"  # The deploy user's password
server "198.58.96.194", :app, :web, :db, :primary => true
set :deploy_to, "/var/webapps/guido"

set :branch, "master"
ssh_options[:forward_agent] = true

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end