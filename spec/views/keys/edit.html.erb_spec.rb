require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/keys/edit.html.erb" do
  include KeysHelper
  
  before(:each) do
    assigns[:key] = @key = stub_model(Key,
      :new_record? => false,
      :name => "value for name",
      :namespace => false
    )
  end
  # 
  # it "should render edit form" do
  #   render "/keys/edit.html.erb"
  #   
  #   response.should have_tag("form[action=#{key_path(@key)}][method=post]") do
  #     with_tag('input#key_name[name=?]', "key[name]")
  #     with_tag('input#key_namespace[name=?]', "key[namespace]")
  #   end
  # end
end


