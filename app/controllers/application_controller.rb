class ApplicationController < ActionController::Base
    # include SessionsHelper
    helper_method :current_user, :logged_in?

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  
    def logged_in?
      !!current_user
    end
  
    def require_user
      unless logged_in?
        flash[:error] = "Vous devez être connecté pour accéder à cette page."
        redirect_to login_path
      end
    end

  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end

  def admin_user?
    current_user && current_user.admin?
  end
end
