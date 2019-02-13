class ApplicationController < ActionController::Base
    before_action :set_locale
    # before_action :authenticate_user! dang nhap de xem. 
    before_action  :configure_permitted_parameters, if: :devise_controller?
    protect_from_forgery with: :exception

    
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    
    protected
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email,:username, :avatar,  :password, :password_confirmation )}
        devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :avatar, :email, :password, :password_confirmation, :current_password, :remember_me) }
      end
  
    private
    def set_locale
      locale = params[:locale].to_s.strip.to_sym
      I18n.locale = I18n.available_locales.include?(locale) ?
        locale : I18n.default_locale

    end
   
    def default_url_options
      {locale: I18n.locale}
    end
    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || posts_path)
    end

    after_action :verify_authorized, unless: :devise_controller?
end
