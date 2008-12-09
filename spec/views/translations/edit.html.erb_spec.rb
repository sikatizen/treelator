require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/translations/edit.html.erb" do
  include TranslationsHelper
  
  before(:each) do
    assigns[:translation] = @translation = stub_model(Translation,
      :new_record? => false,
      :value => "value for value"
    )
  end

  it "should render edit form" do
    render "/translations/edit.html.erb"
    
    response.should have_tag("form[action=#{translation_path(@translation)}][method=post]") do
      with_tag('input#translation_value[name=?]', "translation[value]")
    end
  end
end


