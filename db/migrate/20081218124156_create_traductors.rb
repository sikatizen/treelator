class CreateTraductors < ActiveRecord::Migration
  def self.up
    create_table :traductors, :options => 'DEFAULT CHARSET=utf8' do |t|
      t.integer :user_id
      t.integer :locale_id
    end
  end

  def self.down
    drop_table :locales_users
  end
end
