class ExportController < ApplicationController
  def index
    @locales = Locale.all
    @keys = Key.all
    
    #export
  end
  
  def export_file
  @keys = Key.find_key_without_parent
  @namespaces = Key.find_root_namespaces
  
  export = { }
  for key in @keys
    export["#{key.name}"] = key.find_translation_by_locale(session[:locale].id).value
  end
  
  for namespace in @namespaces do
    export["#{namespace.name}"] = export_namespace(namespace, session[:locale].id)
  end
  @export = {}
  @export["#{session[:locale].iso_code}"] = export
  respond_to do |format|
    format.yaml
    #format.html
  end
  
  end
end