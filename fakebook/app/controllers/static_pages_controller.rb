class StaticPagesController < ApplicationController
  def home
   if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = Micropost.all
   end
  end

  def help
  end

  def about
  end
end
