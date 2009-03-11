require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/translations/index.html.erb" do
  include TranslationsHelper
  
  before(:each) do
    assigns[:translations] = [
      stub_model(Translation,
        :value => "value for value"
      ),
      stub_model(Translation,
        :value => "value for value"
      )
    ]
  end

  # it "should render list of translations" do
  #   render "/translations/index.html.erb"
  #   response.should have_tag("tr>td", "value for value", 2)
  # end
end

