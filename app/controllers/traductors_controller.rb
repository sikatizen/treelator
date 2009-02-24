class TraductorsController < ApplicationController
  before_filter :login_required
  # GET /traductors
  # GET /traductors.xml
  
  def create
    @traductor = Traductor.new( :user => User.find(params[:traductor][:user_id]), :locale => Locale.find(params[:traductor][:locale_id]) )
    respond_to do |format|
      if @traductor.save
        flash[:notice] = 'Translation was successfully created.'
        format.html { redirect_to users_path }
      else
        format.html { redirect_to users_path }
      end
    end
  end
  
  def destroy
    
  end
  
  def authorized?
    is_admin?
  end
end
