class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  include Pagy::Backend
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_user_location!, if: :storable_location?

  def after_sign_in_path_for(resource_or_scope)
    # check for the class of the object to determine what type it is
    case resource.role
    when "admin"
      admins_pages_index_path
    when "pelayan"
      stored_location_for(resource_or_scope) || super
    else
      root_path
    end
  end

  private

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end

  protected


       def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) {
               |u| u.permit(:name, :email, :password, :address, :phone_number, :role)}

            devise_parameter_sanitizer.permit(:account_update) {
               |u| u.permit(:name, :email, :username, :password, :password_confirmation, :current_password, :address, :phone_number, :role )}
       end

end
