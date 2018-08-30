class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  
  ##volta para /users/sign_in após logout
  def after_sign_out_path_for(estagio)
    #request.referrer
    inicials_path
  end
  
  def after_sign_in_path_for(estagio)
    estagios_path
  end
  
end
