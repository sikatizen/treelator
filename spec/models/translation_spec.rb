require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Translation do
  before(:each) do
    @valid_attributes = {
      :key_id => "1",
      :locale_id => "1",
      :value => "value for value"
    }
  end

  it "should create a new instance given valid attributes" do
    Translation.create!(@valid_attributes)
  end
end
