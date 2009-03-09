set :application, "treelator"
set :deploy_to, "/home/treelator/#{application}"

default_run_options[:pty] = true
set :use_sudo, false

set :user, "sikalab"
set :domain, "91.121.143.111"
server domain, :app, :web
role :db, domain, :primary => true
set :runner, "sikalab"

set :scm, :git
set :repository,  "sikalab@91.121.143.111:/home/treelator/treelator.git"
ssh_options[:forward_agent] = true
set :git_enable_submodules, 1

before "deploy:setup", :db
after "deploy:update_code", "db:symlink"
namespace :db do
  desc "Create database yaml in shared path" 
  task :default do
    db_config = ERB.new <<-EOF
    base: &base
      adapter: mysql
      encoding: utf8
      username: services
      password: 6Klqs!ym

    development:
      database: #{application}_dev
      <<: *base

    test:
      database: #{ }_test
      <<: *base

    production:
      database: #{application}_production
      <<: *base
    EOF

    run "mkdir -p #{shared_path}/config" 
    put db_config.result, "#{shared_path}/config/database.yml" 
  end

  desc "Make symlink for database yaml and star/stop script" 
  task :symlink do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end
namespace :deploy do
 desc "Restarting mod_rails with restart.txt"
 task :restart, :roles => :app, :except => { :no_release => true } do
   run "touch #{current_path}/tmp/restart.txt"
 end

 [:start, :stop].each do |t|
   desc "#{t} task is a no-op with mod_rails"
   task t, :roles => :app do ; end
 end
end