# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def display_namespace(namespace)
    html = ""
    html += ""
  end
  
  
  def display_key(key)
    html = ""
    if key.children.empty?
      html += "<li>#{key.name}</li>"
    else
      html += "<li>#{key.name}</li>"
      html += "<ul>"
      
      for child in key.children
        display_key(child)
      end
      html += "</ul>"
    end
    html
  end
  
end
