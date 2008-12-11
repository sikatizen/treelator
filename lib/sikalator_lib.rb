module SikalatorLib
  
  protected


    def import_hash(hash, parent_id=nil)
      hash.each_key {|key| is_hash(hash.values_at(key).first) ? create_namespace(key, hash.values_at(key).first, parent_id) : (create_key_and_translation(key, hash.values_at(key).first, parent_id))}
    end
    
    def is_hash(hash)
      tmp = {}
      hash.class == tmp.class
    end
    
    def create_key_and_translation(key, translation_value,parent_id,locale_id=1)
      key_id = Key.create!( :name => key, :parent_id => parent_id).id
      Translation.create!( :value => translation_value, :key_id => key_id, :locale_id => locale_id)
    end
    
    def create_namespace(key, hash, parent_id)
      parent_id = Key.create!( :name => key, :namespace => true, :parent_id => parent_id).id
      import_hash(hash, parent_id)
    end
end