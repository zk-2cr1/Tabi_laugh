class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :category_all

  def after_sign_out_path_for(resource)
    if resource == :admin
       admin_session_path
    else
       root_path
    end
  end



  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :encrypted_password, :name, :nick_name])
  end
  
  def category_all
      @categories = Category.all
  end
  
end