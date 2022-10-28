class LikesController < ApplicationController
    def create
      @post = Post.find(params[:id])
      like = Like.new(post: @post, user: current_user)
      redirect_to "/users/#{@post[:user_id]}/posts/#{@post[:id]}" if like.save
    end

end
