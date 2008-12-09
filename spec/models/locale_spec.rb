require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Locale do
  before(:each) do
    @valid_attributes = {
      :iso_code => "value for iso_code",
      :name => "value for name"
    }
  end

  it "should create a new instance given valid attributes" do
    Locale.create!(@valid_attributes)
  end
end
