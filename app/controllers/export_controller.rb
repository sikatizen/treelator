class ExportController < ApplicationController
  def index
    @locales = Locale.all
    @keys = Key.all
    
    export
  end
  
  def export
  @keys = Key.find_key_without_parent
  @namespaces = Key.find_root_namespaces
  
  @txt = { }
  for key in @keys
    @txt["#{key.name}"] = key.find_translation_by_locale(session[:locale].id).value
  end
  
  #for namespaces
  end
end