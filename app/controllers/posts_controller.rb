class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = User.find(params[:user_id]).posts
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new
  end

  def new
    post = Post.new
    respond_to do |format|
      format.html { render :new_post, locals: { post: } }
    end
  end

  def create
    post = Post.new(title: params[:post][:title], text: params[:post][:text], user: current_user)

    if post.save
      flash[:success] = 'Post saved successfully'
      redirect_to "/users/#{current_user.id}/posts"
    else
      flash.now[:error] = 'Error: Post could not be saved'
      render inline: '<p>Error: Post could not be saved<p>'
    end
  end

  def like
    post = Post.find(params[:id])
    Like.create(post_like_params, user_like_params: current_user)
    redirect_to "/users/:user_id/posts/#{post[:id]}"
  end

  private
  
  def post_like_params
    params.require(:post).permit(:post_id)
  end

  def user_like_params
    params.require(:user).permit(:user_id)
  end
end
