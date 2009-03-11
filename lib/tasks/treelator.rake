require 'rake'
require 'spec/rake/spectask'

namespace :treelator do

  desc "Add an admin user. Parameters: login= password= email="
  task (:add_admin => :environment) do
    
    login = ENV['login']
    password = ENV['password']
    email = ENV['email']
    
    if login == nil || login == '' || password == nil || password == '' || email == nil || email == ''
      puts "ERROR: One or more parameter missing. Use this task like this: rake treelator:add_admin login=alogin password=apassword email=aemail"
    else
      User.create!("login"=>login, "role"=>"admin", "password"=>password, "password_confirmation"=>password, "email"=>email)
      puts "Admin #{login} created!"
    end
    
  end
  
  desc "Run all spec with RCov"
  Spec::Rake::SpecTask.new('spec_with_rcov') do |t|
    t.spec_files = FileList['spec/**/*.rb']
    t.rcov = true
    t.rcov_opts = ['--exclude', 'examples']
  end
  
end
