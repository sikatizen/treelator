class AddSampleKeys < ActiveRecord::Migration
  
  @menu_keys = ["home", "messages"]
  @footer_keys = ["about", "terms_of_use"]
  def self.up
    # transaction do
    #       ns = Key.create!( :name => "menu", :namespace => true)
    #       for mk in @menu_keys do
    #         Key.create!(:name => mk, :parent_id => ns.id)
    #       end
    #       ns = Key.create!( :name => "footer", :namespace => true)
    #       for fk in @footer_keys do
    #         Key.create!(:name => fk, :parent_id => ns.id)
    #       end
    #     end
    #     locale = Locale.create!(:name => "English US", :iso_code => "en-US")
    #     
    #     Translation.create!(:value => "Home", :locale_id => locale.id, :key_id => Key.find(:first, :conditions => { :name => "home"}).id)
    #     Translation.create!(:value => "Messages", :locale_id => locale.id, :key_id => Key.find(:first, :conditions => { :name => "messages"}).id)
    #     Translation.create!(:value => "About", :locale_id => locale.id, :key_id => Key.find(:first, :conditions => { :name => "about"}).id)
    #     Translation.create!(:value => "Terms of use", :locale_id => locale.id, :key_id => Key.find(:first, :conditions => { :name => "terms_of_use"}).id)
      end

  def self.down
  end
end
