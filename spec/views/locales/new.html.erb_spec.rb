require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/locales/new.html.erb" do
  include LocalesHelper
  
  before(:each) do
    assigns[:locale] = stub_model(Locale,
      :new_record? => true,
      :iso_code => "value for iso_code",
      :name => "value for name"
    )
  end

  # it "should render new form" do
  #   render "/locales/new.html.erb"
  #   
  #   response.should have_tag("form[action=?][method=post]", locales_path) do
  #     with_tag("input#locale_iso_code[name=?]", "locale[iso_code]")
  #     with_tag("input#locale_name[name=?]", "locale[name]")
  #   end
  # end
end


