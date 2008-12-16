class Translation < ActiveRecord::Base
  belongs_to :locale
  belongs_to :key
  validates_presence_of :value, :locale_id, :key_id
  
  def self.find_keys_by_locale(locale_id)
    key = self.find(:all, :select => [ :key_id ], :conditions => { :locale_id => locale_id })
    p key
  end
end
