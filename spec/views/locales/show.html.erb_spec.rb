require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/locales/show.html.erb" do
  include LocalesHelper
  
  before(:each) do
    assigns[:locale] = @locale = stub_model(Locale,
      :iso_code => "value for iso_code",
      :name => "value for name"
    )
  end

  # it "should render attributes in <p>" do
  #   render "/locales/show.html.erb"
  #   response.should have_text(/value\ for\ iso_code/)
  #   response.should have_text(/value\ for\ name/)
  # end
end

