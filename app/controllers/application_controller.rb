class ApplicationController < ActionController::Base
  def current_user
    @posts = Post.where(user_id: current_user).list? 
  end
end
