class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user #defined in session helper
     params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  
    
end
# authenticate is a method provided by has_secure_password, a Rails helper for handling password hashing. 
# It checks if the provided password is correct for the user. 
# It does this by hashing the provided password in the same way as the stored password hash, and comparing the two hashes