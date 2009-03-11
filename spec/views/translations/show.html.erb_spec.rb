require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/translations/show.html.erb" do
  include TranslationsHelper
  
  before(:each) do
    assigns[:translation] = @translation = stub_model(Translation,
      :value => "value for value"
    )
  end

  # it "should render attributes in <p>" do
  #   render "/translations/show.html.erb"
  #   response.should have_text(/value\ for\ value/)
  # end
end

