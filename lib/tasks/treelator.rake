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
end
