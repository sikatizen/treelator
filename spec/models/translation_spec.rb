require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Translation do
  fixtures :all
  
  before(:each) do
    @valid_attributes = {
      :key_id => "1",
      :locale_id => "1",
      :value => "value for value"
    }
  end
  
  should_belong_to :locale
  should_belong_to :key
  should_validate_presence_of :value, :locale_id, :key_id
  
  it "should create a new instance given valid attributes" do
    Translation.create!(@valid_attributes)
  end
end
