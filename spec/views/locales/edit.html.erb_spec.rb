require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/locales/edit.html.erb" do
  include LocalesHelper
  
  before(:each) do
    assigns[:locale] = @locale = stub_model(Locale,
      :new_record? => false,
      :iso_code => "value for iso_code",
      :name => "value for name"
    )
  end

  # it "should render edit form" do
  #   render "/locales/edit.html.erb"
  #   
  #   response.should have_tag("form[action=#{locale_path(@locale)}][method=post]") do
  #     with_tag('input#locale_iso_code[name=?]', "locale[iso_code]")
  #     with_tag('input#locale_name[name=?]', "locale[name]")
  #   end
  # end
end


