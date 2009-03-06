module TreelatorLib
  
  protected

    def import_hash(hash, parent_id=0,locale_id=1)
      hash.each_key {|key| is_hash(hash.values_at(key).first) ? create_namespace(key, hash.values_at(key).first, parent_id, locale_id) : (create_key_and_translation(key, hash.values_at(key).first, parent_id, locale_id))}
    end
    
    def is_hash(hash)
      tmp = {}
      hash.class == tmp.class
    end
    
    def create_key_and_translation(key, translation_value,parent_id,locale_id)
      search_key = Key.first :conditions => {:name => key, :parent_id => parent_id, :namespace => false, :sequence => false}
      if search_key == nil
        key_id = Key.create!( :name => key, :parent_id => parent_id).id
      else
        key_id = search_key.id
      end
      
      search_translation = Translation.first :conditions => {:key_id => key_id, :locale_id => locale_id}
      if search_translation == nil
        unless translation_value == "" || translation_value.nil?
          Translation.create!(:value => translation_value, :key_id => key_id, :locale_id => locale_id)
        end
      end
    end
    
    def create_namespace(key, hash, parent_id, locale_id)
      search_namespace = Key.first :conditions => {:name => key, :parent_id => parent_id, :namespace => true, :sequence => false}
      if search_namespace == nil
        parent_id = Key.create!( :name => key, :namespace => true, :parent_id => parent_id).id
        import_hash(hash, parent_id,locale_id)
      else
        import_hash(hash, search_namespace.id,locale_id)
      end
    end
    
    def export_namespace(namespace, locale_id)
      export = {}
      
      for child in namespace.children do
        if child.namespace
          export["#{child.name}"] = export_namespace(child, locale_id)
        else
          export["#{child.name}"] = child.find_translation_by_locale(locale_id).value if child.find_translation_by_locale(locale_id) 
        end
      end
      export
    end
    
    def is_admin?
      logged_in? && current_user.role == "admin"
    end
    
    def is_translator?
      logged_in? && (current_user.role == "translator" || current_user.role == "supervisor" || current_user.role == "admin")
    end
end