class CreateLocales < ActiveRecord::Migration
  def self.up
    create_table :locales, :options => 'DEFAULT CHARSET=utf8' do |t|
      t.string :iso_code
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :locales
  end
end
