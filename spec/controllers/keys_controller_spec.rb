require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe KeysController do

  def mock_key(stubs={})
    @mock_key ||= mock_model(Key, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all keys as @keys" do
      Key.should_receive(:find).with(:all).and_return([mock_key])
      get :index
      assigns[:keys].should == [mock_key]
    end

    describe "with mime type of xml" do
  
      it "should render all keys as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Key.should_receive(:find).with(:all).and_return(keys = mock("Array of Keys"))
        keys.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested key as @key" do
      Key.should_receive(:find).with("37").and_return(mock_key)
      get :show, :id => "37"
      assigns[:key].should equal(mock_key)
    end
    
    describe "with mime type of xml" do

      it "should render the requested key as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Key.should_receive(:find).with("37").and_return(mock_key)
        mock_key.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new key as @key" do
      Key.should_receive(:new).and_return(mock_key)
      get :new
      assigns[:key].should equal(mock_key)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested key as @key" do
      Key.should_receive(:find).with("37").and_return(mock_key)
      get :edit, :id => "37"
      assigns[:key].should equal(mock_key)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created key as @key" do
        Key.should_receive(:new).with({'these' => 'params'}).and_return(mock_key(:save => true))
        post :create, :key => {:these => 'params'}
        assigns(:key).should equal(mock_key)
      end

      it "should redirect to the created key" do
        Key.stub!(:new).and_return(mock_key(:save => true))
        post :create, :key => {}
        response.should redirect_to(key_url(mock_key))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved key as @key" do
        Key.stub!(:new).with({'these' => 'params'}).and_return(mock_key(:save => false))
        post :create, :key => {:these => 'params'}
        assigns(:key).should equal(mock_key)
      end

      it "should re-render the 'new' template" do
        Key.stub!(:new).and_return(mock_key(:save => false))
        post :create, :key => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested key" do
        Key.should_receive(:find).with("37").and_return(mock_key)
        mock_key.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :key => {:these => 'params'}
      end

      it "should expose the requested key as @key" do
        Key.stub!(:find).and_return(mock_key(:update_attributes => true))
        put :update, :id => "1"
        assigns(:key).should equal(mock_key)
      end

      it "should redirect to the key" do
        Key.stub!(:find).and_return(mock_key(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(key_url(mock_key))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested key" do
        Key.should_receive(:find).with("37").and_return(mock_key)
        mock_key.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :key => {:these => 'params'}
      end

      it "should expose the key as @key" do
        Key.stub!(:find).and_return(mock_key(:update_attributes => false))
        put :update, :id => "1"
        assigns(:key).should equal(mock_key)
      end

      it "should re-render the 'edit' template" do
        Key.stub!(:find).and_return(mock_key(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested key" do
      Key.should_receive(:find).with("37").and_return(mock_key)
      mock_key.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the keys list" do
      Key.stub!(:find).and_return(mock_key(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(keys_url)
    end

  end

end
