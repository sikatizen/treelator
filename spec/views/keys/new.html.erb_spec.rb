require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/keys/new.html.erb" do
  include KeysHelper
  
  before(:each) do
    assigns[:key] = stub_model(Key,
      :new_record? => true,
      :name => "value for name",
      :namespace => false
    )
  end

  # it "should render new form" do
  #   render "/keys/new.html.erb"
  #   
  #   response.should have_tag("form[action=?][method=post]", keys_path) do
  #     with_tag("input#key_name[name=?]", "key[name]")
  #     with_tag("input#key_namespace[name=?]", "key[namespace]")
  #   end
  # end
end


