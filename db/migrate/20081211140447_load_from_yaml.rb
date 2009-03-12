require 'yaml'
include TreelatorLib
class LoadFromYaml < ActiveRecord::Migration
  def self.up
    locale = Locale.create!(:name => "English US", :iso_code => "en-US")
    file = File.new("#{LOCALES_DIRECTORY}/#{locale.iso_code}.yml")
    hash = YAML.load(file)
    import_hash(hash.values_at(locale.iso_code).first)
    
    file = File.new("#{LOCALES_DIRECTORY}/ce.yml")
    hash = YAML.load(file)
    import_hash(hash)
    
    
    namespace = Key.find(:first, :conditions => { :name => "date", :namespace => true })
    day_names = Key.create!( :sequence => true, :name => "day_names", :parent_id => namespace.id )
    abbr_day_names = Key.create!( :sequence => true, :name => "abbr_day_names", :parent_id => namespace.id )
    month_names = Key.create!( :sequence => true, :name => "month_names", :parent_id => namespace.id )
    abbr_month_names = Key.create!( :sequence => true, :name => "abbr_month_names", :parent_id => namespace.id )
    order_ns = Key.create!( :sequence => true, :name => "order", :parent_id => namespace.id )
    
    #created key that are displaying as a sequence ( eg: day_names: ["monday", "tuesday", "wednesday"])
    
    for day in ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"] do
      key = Key.create!( :name => day, :parent_id => day_names.id )
      Translation.create!( :value => day, :key_id => key.id, :locale_id => locale.id)
    end
    
    for day in ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"] do
      key = Key.create!( :name => day, :parent_id => abbr_day_names.id )
      Translation.create!( :value => day, :key_id => key.id, :locale_id => locale.id)
    end
    
    for month in ["~", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"] do
      key = Key.create!( :name => month, :parent_id => month_names.id )
      Translation.create!( :value => month, :key_id => key.id, :locale_id => locale.id)
    end
    
    for month in ["~", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"] do
      key = Key.create!( :name => month, :parent_id => abbr_month_names.id )
      Translation.create!( :value => month, :key_id => key.id, :locale_id => locale.id)
    end
    
    for order in [ ":year", ":month", ":day" ] do
      key = Key.create!( :name => order, :parent_id => order_ns.id )
      Translation.create!( :value => order, :key_id => key.id, :locale_id => locale.id)
    end
    
    namespace = Key.find(:first, :conditions => { :name => "error", :namespace => true })
    header_message = Key.create!( :sequence => true, :name => "header_message", :parent_id => namespace.id )
    
    for error in ["Couldn't save this {{object_name}}: 1 error", "Couldn't save this {{object_name}}: {{count}} errors."] do
      key = Key.create!( :name => error, :parent_id => header_message.id, :is_string => true )
      Translation.create!( :value => error, :key_id => key.id, :locale_id => locale.id)
    end
  end

  def self.down
  end
end
