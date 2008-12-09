require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/keys/show.html.erb" do
  include KeysHelper
  
  before(:each) do
    assigns[:key] = @key = stub_model(Key,
      :name => "value for name",
      :namespace => false
    )
  end

  it "should render attributes in <p>" do
    render "/keys/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/als/)
  end
end

