require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe KeysController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "keys", :action => "index").should == "/keys"
    end
  
    it "should map #new" do
      route_for(:controller => "keys", :action => "new").should == "/keys/new"
    end
  
    it "should map #show" do
      route_for(:controller => "keys", :action => "show", :id => 1).should == "/keys/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "keys", :action => "edit", :id => 1).should == "/keys/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "keys", :action => "update", :id => 1).should == "/keys/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "keys", :action => "destroy", :id => 1).should == "/keys/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/keys").should == {:controller => "keys", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/keys/new").should == {:controller => "keys", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/keys").should == {:controller => "keys", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/keys/1").should == {:controller => "keys", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/keys/1/edit").should == {:controller => "keys", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/keys/1").should == {:controller => "keys", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/keys/1").should == {:controller => "keys", :action => "destroy", :id => "1"}
    end
  end
end
