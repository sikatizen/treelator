class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true, :options => 'DEFAULT CHARSET=utf8' do |t|
      t.column :login,                     :string, :limit => 40
      t.column :name,                      :string, :limit => 100, :default => '', :null => true
      t.column :email,                     :string, :limit => 100
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string, :limit => 40
      t.column :remember_token_expires_at, :datetime
      t.column :role,                      :string

    end
    add_index :users, :login, :unique => true
    User.create!( "password_confirmation"=>"calame", "role"=>"admin", "password"=>"calame", "login"=>"admin", "email"=>"jonathan.biolaz@sikatizen.com")
  end

  def self.down
    drop_table "users"
  end
end
