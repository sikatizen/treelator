class Key < ActiveRecord::Base
  
  belongs_to :parent, :class_name => "Key"
  has_many :children, :class_name => "Key", :foreign_key => "parent_id"
  
  has_many :translations
  has_many :locales, :through => :translations
  
  def self.find_key_without_parent
    self.find(:all, :conditions => { :parent_id => nil, :namespace => false })
  end
  
  def self.find_namespaces
    self.find(:all, :conditions => { :namespace => true })
  end
  
  def self.find_root_namespaces
    self.find(:all, :conditions => { :namespace => true, :parent_id => nil })
  end
  
  def self.find_sequences
    self.find(:all, :conditions => { :sequence => true })
  end
  
  def find_translation_by_locale(locale_id)
    Translation.find(:first, :conditions => { :key_id => self.id, :locale_id => locale_id})
  end
  
end
