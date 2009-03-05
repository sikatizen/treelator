# == Schema Information
# Schema version: 20081218124156
#
# Table name: translations
#
#  id         :integer(4)      not null, primary key
#  key_id     :integer(4)
#  locale_id  :integer(4)
#  value      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Translation < ActiveRecord::Base
  belongs_to :locale
  belongs_to :key
  validates_presence_of :value, :locale_id, :key_id
  
  def self.find_keys_by_locale(locale_id)
    key = self.find(:all, :select => [ :key_id ], :conditions => { :locale_id => locale_id })
  end
end
