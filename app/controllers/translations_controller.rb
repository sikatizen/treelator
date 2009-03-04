class TranslationsController < ApplicationController
  before_filter :login_required
  # GET /translations
  # GET /translations.xml
  def index
    
    if params[:main_language_id] != nil || params[:main_language_id] != ''
      session[:main_language_id] = params[:main_language_id]
    end
      
    @locales = Locale.all
    
    @locales_array = Array.new
    @locales.each{ |locale| @locales_array << [locale.name, locale.id]}
    
    @keys = Key.find_key_without_parent
    # params[:namespace_id] ? @namespace = Key.find(params[:namespace_id].to_i) : nil
    @namespaces = Key.find_root_namespaces
    @sequences = Key.find_sequences
    
    respond_to do |format|
      format.html
    end
  end

  def create
    @translation = Translation.new(params[:translation])
    @translation.save!
    @key = Key.find(@translation.key_id)
    
    render :update do |page|
      page.replace "key_#{@translation.key_id}", :partial => "translations/key", :locals => { :key => @key, :namespace_id => params[:namespace_id].to_i }
      page << "$('key_#{@translation.key_id}').highlight();"
    end
    
    #respond_to do |format|
    #  if @translation.save
    #    flash[:notice] = 'Translation was successfully created.'
    #    format.html { redirect_to translations_path( :namespace_id => params[:namespace_id], :locale_id => session[:locale_id]) }
    #    format.xml  { render :xml => @translation, :status => :created, :location => @translation }
    #  else
    #    format.html { render :action => "new" }
    #    format.xml  { render :xml => @translation.errors, :status => :unprocessable_entity }
    #  end
    #end
  end
  
  def update
    @translation = Translation.find(params[:id])
    @namespace_id = params[:namespace_id].to_i
    @key = Key.find(@translation.key_id)
    @translation.update_attributes!(params[:translation])
    render :update do |page|
      page.replace "key_#{@translation.key_id}", :partial => "translations/key", :locals => { :key => @key, :namespace_id => @namespace_id }
      page << "$('key_#{@translation.key_id}').highlight();"
    end
  end
  
  def authorized?
    is_admin? || is_translator?
  end
end
