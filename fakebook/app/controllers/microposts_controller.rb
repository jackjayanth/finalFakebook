class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
   def create
   @micropost = current_user.microposts.build(micropost_params)
   if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
   end
   end
 
  
  def destroy

  end
  
  private
  
    def micropost_params
      params.require(:micropost).permit(:content)
    end
  def logged_in_user
      unless logged_in?
      redirect_to login_url
      end
  end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
