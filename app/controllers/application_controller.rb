class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

    helper_method :current_user, :logged_in?
    def current_user
        begin
            @current_user ||= User.find(session[:user_id]) if session[:user_id]
        rescue ActiveRecord::RecordNotFound
            @current_user = nil
            session[:user_id] = nil
        end
    end

    def logged_in?
        !!current_user
    end
end
