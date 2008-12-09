require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TranslationsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "translations", :action => "index").should == "/translations"
    end
  
    it "should map #new" do
      route_for(:controller => "translations", :action => "new").should == "/translations/new"
    end
  
    it "should map #show" do
      route_for(:controller => "translations", :action => "show", :id => 1).should == "/translations/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "translations", :action => "edit", :id => 1).should == "/translations/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "translations", :action => "update", :id => 1).should == "/translations/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "translations", :action => "destroy", :id => 1).should == "/translations/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/translations").should == {:controller => "translations", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/translations/new").should == {:controller => "translations", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/translations").should == {:controller => "translations", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/translations/1").should == {:controller => "translations", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/translations/1/edit").should == {:controller => "translations", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/translations/1").should == {:controller => "translations", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/translations/1").should == {:controller => "translations", :action => "destroy", :id => "1"}
    end
  end
end
