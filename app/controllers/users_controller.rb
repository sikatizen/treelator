class UsersController < ApplicationController
  # render new.rhtml
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
  
  def authorized?
    is_admin?
  end
  
  def destroy
    @user = User.find(params[:id])
    if params[:id].to_i != 1
      @user.destroy
      flash[:notice] = "User Removed"
    else
      flash[:error] = "You can't remove the first user !"
    end
    
    respond_to do |format|
      format.html { redirect_to(users_path) }
      format.xml  { head :ok }
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to users_path }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def authorized?
    is_admin?
  end
end
