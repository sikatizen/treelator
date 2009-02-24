class Locale < ActiveRecord::Base
  has_many :translations
  has_many :keys, :through => :translations
  
  validates_presence_of :name, :iso_code
  
  has_many :traductors
  has_many :users, :through => :traductors
end
