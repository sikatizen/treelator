class ExportController < ApplicationController
  def index
    @locales = Locale.all
  end
  
  def export_file
    @locale = Locale.find(params[:locale_id])
    @keys = Key.find_key_without_parent
    @namespaces = Key.find_root_namespaces
    
    export = { }
    for key in @keys
      export["#{key.name}"] = key.find_translation_by_locale(@locale.id).value
    end
    
    for namespace in @namespaces do
      export["#{namespace.name}"] = export_namespace(namespace, @locale.id)
    end
    @export = {}
    @export["#{@locale.iso_code}"] = export
     
    respond_to do |format|
      response.headers['Content-Type'] = 'text/yml'
      response.headers['Content-Disposition'] = "attachment; filename=#{@locale.iso_code}.yml"
      format.yaml
    end
  end
end