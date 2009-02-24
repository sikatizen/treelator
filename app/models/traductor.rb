class Traductor < ActiveRecord::Base
  belongs_to :locale
  belongs_to :user
  validates_uniqueness_of :locale_id, :scope => :user_id
  validates_presence_of :user_id, :locale_id
end
