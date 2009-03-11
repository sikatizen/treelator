require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Locale do
  before(:each) do
    @valid_attributes = {
      :iso_code => "value for iso_code",
      :name => "value for name"
    }
  end
  should_have_many :translations
  should_have_many :keys, :through => :translations
  
  should_validate_presence_of :name, :iso_code
  
  should_have_many :traductors
  should_have_many :users, :through => :traductors

  it "should create a new instance given valid attributes" do
    Locale.create!(@valid_attributes)
  end
end
