class TranslationsController < ApplicationController

  def index
    @locales = Locale.all
    @keys = Key.paginate :all, :page => params[:page], :order => 'updated_at DESC', :conditions => { :namespace => false }
    params[:namespace_id] ? @namespace = Key.find(params[:namespace_id].to_i) : nil
    @namespaces = Key.find_namespaces
    respond_to do |format|
      format.html
    end
  end

end
