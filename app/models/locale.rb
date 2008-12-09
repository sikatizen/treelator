class Locale < ActiveRecord::Base
  has_many :translations
  has_many :keys, :through => :translations
end
