# == Schema Information
# Schema version: 20081218124156
#
# Table name: keys
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  parent_id  :integer(4)
#  namespace  :boolean(1)
#  sequence   :boolean(1)
#  is_string  :boolean(1)
#  created_at :datetime
#  updated_at :datetime
#

class Key < ActiveRecord::Base
  
  belongs_to :parent, :class_name => "Key"
  has_many :children, :class_name => "Key", :foreign_key => "parent_id", :dependent => :destroy
  
  has_many :translations
  has_many :locales, :through => :translations
  
  validates_presence_of :name, :parent_id
  
  def self.find_key_without_parent
    self.find(:all, :conditions => { :parent_id => 0, :namespace => false })
  end
  
  def self.find_namespaces
    self.find(:all, :conditions => { :namespace => true })
  end
  
  def self.find_root_namespaces
    self.find(:all, :conditions => { :namespace => true, :parent_id => 0 })
  end
  
  def self.find_sequences
    self.find(:all, :conditions => { :sequence => true })
  end
  
  def find_translation_by_locale(locale_id)
    Translation.find(:first, :conditions => { :key_id => self.id, :locale_id => locale_id})
  end
  
end
