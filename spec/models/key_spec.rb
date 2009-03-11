require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Key do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :parent_id => "1",
      :namespace => false
    }
  end
  
  should_have_many(:translations)
  should_have_many :locales, :through => :translations
  
  should_belong_to :parent, :class_name => "Key"
  should_have_many :children, :class_name => "Key", :foreign_key => "parent_id"
  
  should_validate_presence_of :name
  should_validate_presence_of :parent_id
  
  it "should create a new instance given valid attributes" do
    Key.create!(@valid_attributes)
  end
end
