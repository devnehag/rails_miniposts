module SessionsHelper
    # Logs in the given user.
  def log_in(user) # user argument is an instance of the User model.
    session[:user_id] = user.id #Body of the login method
    end
end

  # Returns the current logged-in user (if any).

  def current_user
    if session[:user_id]
    @current_user ||= User.find_by(id: session[:user_id])
    end
  end
    
  # Returns true if the user is logged in, false otherwise.

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
    end 
# session is a special kind of hash that Rails provides. 
# It is used to store data that persists between requests. 
# The data in the session is stored in the user's browser, so it can be used to maintain state during the user's interaction with the application.