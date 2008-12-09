require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TranslationsController do

  def mock_translation(stubs={})
    @mock_translation ||= mock_model(Translation, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all translations as @translations" do
      Translation.should_receive(:find).with(:all).and_return([mock_translation])
      get :index
      assigns[:translations].should == [mock_translation]
    end

    describe "with mime type of xml" do
  
      it "should render all translations as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Translation.should_receive(:find).with(:all).and_return(translations = mock("Array of Translations"))
        translations.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested translation as @translation" do
      Translation.should_receive(:find).with("37").and_return(mock_translation)
      get :show, :id => "37"
      assigns[:translation].should equal(mock_translation)
    end
    
    describe "with mime type of xml" do

      it "should render the requested translation as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Translation.should_receive(:find).with("37").and_return(mock_translation)
        mock_translation.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new translation as @translation" do
      Translation.should_receive(:new).and_return(mock_translation)
      get :new
      assigns[:translation].should equal(mock_translation)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested translation as @translation" do
      Translation.should_receive(:find).with("37").and_return(mock_translation)
      get :edit, :id => "37"
      assigns[:translation].should equal(mock_translation)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created translation as @translation" do
        Translation.should_receive(:new).with({'these' => 'params'}).and_return(mock_translation(:save => true))
        post :create, :translation => {:these => 'params'}
        assigns(:translation).should equal(mock_translation)
      end

      it "should redirect to the created translation" do
        Translation.stub!(:new).and_return(mock_translation(:save => true))
        post :create, :translation => {}
        response.should redirect_to(translation_url(mock_translation))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved translation as @translation" do
        Translation.stub!(:new).with({'these' => 'params'}).and_return(mock_translation(:save => false))
        post :create, :translation => {:these => 'params'}
        assigns(:translation).should equal(mock_translation)
      end

      it "should re-render the 'new' template" do
        Translation.stub!(:new).and_return(mock_translation(:save => false))
        post :create, :translation => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested translation" do
        Translation.should_receive(:find).with("37").and_return(mock_translation)
        mock_translation.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :translation => {:these => 'params'}
      end

      it "should expose the requested translation as @translation" do
        Translation.stub!(:find).and_return(mock_translation(:update_attributes => true))
        put :update, :id => "1"
        assigns(:translation).should equal(mock_translation)
      end

      it "should redirect to the translation" do
        Translation.stub!(:find).and_return(mock_translation(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(translation_url(mock_translation))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested translation" do
        Translation.should_receive(:find).with("37").and_return(mock_translation)
        mock_translation.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :translation => {:these => 'params'}
      end

      it "should expose the translation as @translation" do
        Translation.stub!(:find).and_return(mock_translation(:update_attributes => false))
        put :update, :id => "1"
        assigns(:translation).should equal(mock_translation)
      end

      it "should re-render the 'edit' template" do
        Translation.stub!(:find).and_return(mock_translation(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested translation" do
      Translation.should_receive(:find).with("37").and_return(mock_translation)
      mock_translation.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the translations list" do
      Translation.stub!(:find).and_return(mock_translation(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(translations_url)
    end

  end

end
