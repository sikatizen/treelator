class CreateLocales < ActiveRecord::Migration
  def self.up
    create_table :locales do |t|
      t.string :iso_code
      t.string :name

      t.timestamps
    end
    
    Locale.create!( :iso_code => "en-US", :name => "English US")
    Locale.create!( :iso_code => "fr_FR", :name => "Français (France)")
  end

  def self.down
    drop_table :locales
  end
end
