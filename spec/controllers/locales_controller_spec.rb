require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
include AuthenticatedTestHelper
include TreelatorTestHelper
describe LocalesController do
  fixtures :users, :locales
  before(:each) do
    login_as :admin
    set_local :english
  end
  
  def mock_locale(stubs={})
    @mock_locale ||= mock_model(Locale, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all locales as @locales" do
      Locale.should_receive(:find).with(:all).and_return([mock_locale])
      get :index
      assigns[:locales].should == [mock_locale]
    end

  end

  describe "responding to GET new" do
  
    it "should expose a new locale as @locale" do
      Locale.should_receive(:new).and_return(mock_locale)
      get :new
      assigns[:locale].should equal(mock_locale)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested locale as @locale" do
      Locale.should_receive(:find).with("37").and_return(mock_locale)
      get :edit, :id => "37"
      assigns[:locale].should equal(mock_locale)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created locale as @locale" do
        Locale.should_receive(:new).with({'these' => 'params'}).and_return(mock_locale(:save => true))
        post :create, :locale => {:these => 'params'}
        assigns(:locale).should equal(mock_locale)
      end

      it "should redirect to the created locale" do
        Locale.stub!(:new).and_return(mock_locale(:save => true))
        post :create, :locale => {}
        response.should redirect_to(locales_url)
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved locale as @locale" do
        Locale.stub!(:new).with({'these' => 'params'}).and_return(mock_locale(:save => false))
        post :create, :locale => {:these => 'params'}
        assigns(:locale).should equal(mock_locale)
      end

      it "should re-render the 'new' template" do
        Locale.stub!(:new).and_return(mock_locale(:save => false))
        post :create, :locale => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT update" do

    describe "with valid params" do

      it "should update the requested locale" do
        Locale.should_receive(:find).with("37").and_return(mock_locale)
        mock_locale.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :locale => {:these => 'params'}
      end

      it "should expose the requested locale as @locale" do
        Locale.stub!(:find).and_return(mock_locale(:update_attributes => true))
        put :update, :id => "1"
        assigns(:locale).should equal(mock_locale)
      end

      it "should redirect to the locales path" do
        Locale.stub!(:find).and_return(mock_locale(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(locales_url)
      end

    end
    
    describe "with invalid params" do

      it "should update the requested locale" do
        Locale.should_receive(:find).with("37").and_return(mock_locale)
        mock_locale.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :locale => {:these => 'params'}
      end

      it "should expose the locale as @locale" do
        Locale.stub!(:find).and_return(mock_locale(:update_attributes => false))
        put :update, :id => "1"
        assigns(:locale).should equal(mock_locale)
      end

      it "should re-render the 'edit' template" do
        Locale.stub!(:find).and_return(mock_locale(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested locale" do
      Locale.should_receive(:find).with("37").and_return(mock_locale)
      mock_locale.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the locales list" do
      Locale.stub!(:find).and_return(mock_locale(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(locales_url)
    end

  end

end
