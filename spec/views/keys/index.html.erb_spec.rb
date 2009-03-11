require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/keys/index.html.erb" do
  include KeysHelper
  
  before(:each) do
    assigns[:keys] = [
      stub_model(Key,
        :name => "value for name",
        :namespace => false
      ),
      stub_model(Key,
        :name => "value for name",
        :namespace => false
      )
    ]
  end

  # it "should render list of keys" do
  #   render "/keys/index.html.erb"
  #   response.should have_tag("tr>td", "value for name", 2)
  #   response.should have_tag("tr>td", false, 2)
  # end
end

