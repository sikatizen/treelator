require 'yaml'
include SikalatorLib
class LoadFromYaml < ActiveRecord::Migration
  def self.up
    locale = Locale.create!(:name => "English US", :iso_code => "en-US")
    file = File.new("#{LOCALES_DIRECTORY}/#{locale.iso_code}.yml")
    hash = YAML.load(file)
    import_hash(hash.values_at(locale.iso_code).first)
  end

  def self.down
  end
end
