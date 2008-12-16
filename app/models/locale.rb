class Locale < ActiveRecord::Base
  has_many :translations
  has_many :keys, :through => :translations
  
  validates_presence_of :name, :iso_code
end
