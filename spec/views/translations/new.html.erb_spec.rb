require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/translations/new.html.erb" do
  include TranslationsHelper
  
  before(:each) do
    assigns[:translation] = stub_model(Translation,
      :new_record? => true,
      :value => "value for value"
    )
  end

  it "should render new form" do
    render "/translations/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", translations_path) do
      with_tag("input#translation_value[name=?]", "translation[value]")
    end
  end
end


