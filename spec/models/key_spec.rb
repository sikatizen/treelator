require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Key do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :parent_id => "1",
      :namespace => false
    }
  end

  it "should create a new instance given valid attributes" do
    Key.create!(@valid_attributes)
  end
end
