class TranslationsController < ApplicationController
  before_filter :login_required
  # GET /translations
  # GET /translations.xml
  def index
    @locales = Locale.all
    @keys = Key.find_key_without_parent
    params[:namespace_id] ? @namespace = Key.find(params[:namespace_id].to_i) : nil
    @namespaces = Key.find_root_namespaces
    @sequences = Key.find_sequences
    respond_to do |format|
      format.html
    end
  end

  def create
    @translation = Translation.new(params[:translation])
    respond_to do |format|
      if @translation.save
        flash[:notice] = 'Translation was successfully created.'
        format.html { redirect_to translations_path( :namespace_id => params[:namespace_id], :locale_id => session[:locale_id]) }
        format.xml  { render :xml => @translation, :status => :created, :location => @translation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @translation.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @translation = Translation.find(params[:id])

    respond_to do |format|
      if @translation.update_attributes(params[:translation])
        format.html { redirect_to translations_path( :namespace_id => params[:namespace_id], :locale_id => session[:locale_id]) }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def authorized?
    is_admin? || is_translator?
  end
end
