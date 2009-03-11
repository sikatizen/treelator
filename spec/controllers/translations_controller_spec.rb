# require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
# include AuthenticatedTestHelper
# describe TranslationsController do
#   fixtures :users
#   
#   before(:each) do
#     login_as :admin
#   end
# 
#   def mock_translation(stubs={})
#     @mock_translation ||= mock_model(Translation, stubs)
#   end
#   
#   def mock_key(stubs={})
#     @mock_key ||= mock_model(Key, stubs)
#   end
#   
#   describe "responding to GET index" do
#   end
# 
# 
#   describe "responding to POST create" do
# 
#     describe "with valid params" do
#       
#       it "should expose a newly created translation as @translation" do
#         Translation.should_receive(:new).with({'these' => 'params'}).and_return(mock_translation(:save => true))
#         mock_translation.should_receive(:key_id)
#         Key.should_receive(:find).and_return(mock_key)
#         mock_translation.should_receive(:save!).and_return(true)
#         post :create, :translation => {:these => 'params'}
#         assigns(:translation).should equal(mock_translation)
#       end
#       
#     end
#     
#     describe "with invalid params" do
# 
#       it "should expose a newly created but unsaved translation as @translation" do
#         Translation.stub!(:new).with({'these' => 'params'}).and_return(mock_translation(:save => false))
#         post :create, :translation => {:these => 'params'}
#         assigns(:translation).should equal(mock_translation)
#       end
#       
#     end
#     
#   end
# 
#   describe "responding to PUT udpate" do
# 
#     describe "with valid params" do
# 
#       it "should update the requested translation" do
#         Translation.should_receive(:find).with("37").and_return(mock_translation)
#         Key.should_receive(:find).with("12").and_return(mock_key)
#         mock_translation.should_receive(:key_id)
#         mock_translation.should_receive(:update_attributes!).with({'these' => 'params'})
#         
#         put :update, :id => "37", :translation => {:these => 'params'}
#       end
# 
#       it "should expose the requested translation as @translation" do
#         Translation.stub!(:find).and_return(mock_translation(:update_attributes => true))
#         put :update, :id => "1"
#         assigns(:translation).should equal(mock_translation)
#       end
# 
#     end
#     
#     describe "with invalid params" do
# 
#       it "should update the requested translation" do
#         Translation.should_receive(:find).with("37").and_return(mock_translation)
#         mock_translation.should_receive(:update_attributes).with({'these' => 'params'})
#         put :update, :id => "37", :translation => {:these => 'params'}
#       end
# 
#       it "should expose the translation as @translation" do
#         Translation.stub!(:find).and_return(mock_translation(:update_attributes => false))
#         put :update, :id => "1"
#         assigns(:translation).should equal(mock_translation)
#       end
# 
#     end
# 
#   end
# 
# end
