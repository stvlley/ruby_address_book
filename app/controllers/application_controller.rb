class ApplicationController < ActionController::Base

  

       # Make the current_user method available to views also, not just controllers:
  helper_method :current_user
  
  # Define the current_user method:
  def current_user
    # Look up the current user based on user_id in the session cookie:
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if session[:user_id]
      User.find session[:user_id]
    end
  end

  def authenticate 
    if !current_user
      redirect_to signup_path, alert: "Invalid request"
    end
  end

  private
    def login(user)
      session[:user_id] = user.id
    end

    def logout
      session[:user_id] = nil
    end 

end

