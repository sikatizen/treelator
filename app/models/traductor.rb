# == Schema Information
# Schema version: 20081218124156
#
# Table name: traductors
#
#  id        :integer(4)      not null, primary key
#  user_id   :integer(4)
#  locale_id :integer(4)
#

class Traductor < ActiveRecord::Base
  belongs_to :locale
  belongs_to :user
  validates_uniqueness_of :locale_id, :scope => :user_id
  validates_presence_of :user_id, :locale_id
end
