# == Schema Information
# Schema version: 20081218124156
#
# Table name: locales
#
#  id         :integer(4)      not null, primary key
#  iso_code   :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Locale < ActiveRecord::Base
  has_many :translations
  has_many :keys, :through => :translations
  
  validates_presence_of :name, :iso_code
  
  has_many :traductors
  has_many :users, :through => :traductors
end
