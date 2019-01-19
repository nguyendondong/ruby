class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private
  
    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || posts_path)
    end

    after_action :verify_authorized, unless: :devise_controller?
end
