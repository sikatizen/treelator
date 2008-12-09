require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/locales/index.html.erb" do
  include LocalesHelper
  
  before(:each) do
    assigns[:locales] = [
      stub_model(Locale,
        :iso_code => "value for iso_code",
        :name => "value for name"
      ),
      stub_model(Locale,
        :iso_code => "value for iso_code",
        :name => "value for name"
      )
    ]
  end

  it "should render list of locales" do
    render "/locales/index.html.erb"
    response.should have_tag("tr>td", "value for iso_code", 2)
    response.should have_tag("tr>td", "value for name", 2)
  end
end

