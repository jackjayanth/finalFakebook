class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
     log_in user
     redirect_to user
    else
      #flash is not working
      #flash[:danger] = 'invalid email password combination'
      @msg_login_err = 'invalid email password combination'
      render 'new'
    end
  end
  
  def destroy
    log_out 
    redirect_to root_url
  end
end
