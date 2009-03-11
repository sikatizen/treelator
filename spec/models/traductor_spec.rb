require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Traductor do
  fixtures :all
  
  before(:each) do
    @valid_attributes = {
      :user_id => "1",
      :locale_id => "1" 
     }
  end
  
  should_belong_to :locale
  should_belong_to :user

  require_unique_attributes :locale_id, :scope => :user_id
  should_validate_presence_of :user_id, :locale_id
  
  it "should create a new instance given valid attributes" do
    Traductor.create!(@valid_attributes)
  end
end
