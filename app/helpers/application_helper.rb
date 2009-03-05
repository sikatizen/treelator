# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include SikalatorLib
  def display_namespaces(key, padding=0)
    html = "<div style=\"padding-left:#{padding}px\">"
    if key.children.empty? && key.namespace == true
      html += "<b>#{key.name}</b>"
    elsif key.children.empty?
      html += display_key(key)
    else
      html += "<b>#{key.name}</b>"
      for child in key.children
        html += display_namespaces(child, padding+6)
      end
    end
    html += "</div>"
    html
  end
  
  
  def display_key(key)
    html= "<b>#{key.name}</b>"
    html += " | "
    html += (link_to "edit", edit_key_path(key))
    html += " | "
    html += (link_to "Destroy", key, :confirm => "are you sure ?", :method => :delete)
  end
  
  def merge_sequence_string(sequence)
    str = "["
    for child in sequence.children do
      unless child.find_translation_by_locale(session[:locale].id).nil?
        if child == sequence.children.last
          if child.is_string
            str += "\"#{child.find_translation_by_locale(session[:locale].id).value}\""
          else
           str += "#{child.find_translation_by_locale(session[:locale].id).value}"
         end
        else
          if child.is_string
            str += "\"#{child.find_translation_by_locale(session[:locale].id).value}\", "
          else
            str += "#{child.find_translation_by_locale(session[:locale].id).value}, "
          end
        end
      end
    end
    str += "]"
    return str
  end

end
