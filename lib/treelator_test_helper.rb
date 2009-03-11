module TreelatorTestHelper
  
  def set_local(local)
    @request.session[:locale] = local ? locales(local).id : 1
  end
  
end