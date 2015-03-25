class PostsController < ApplicationController
  def new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    user = User.find(session[:user]["id"])
    user.posts.create(post_params)
    user.increment! :total_posts
    redirect_to thread_path(params[:board_id], params[:thread_id])
  end

  def post_params
    params.require(:post).permit(:mb_thread_id, :message)
  end

  def delete
    post = Post.find(params[:id])
    if session[:user]["admin"] == 1 && post
      post.destroy
      User.where(id: post.user_id).update_all('total_posts = total_posts - 1')
      redirect_to '/threads/#{post.mb_thread.}'
    else
      @message = "Error: Forbidden action"
      render 'layouts/message'
    end
  end

  def update
    post = Post.find(params[:post][:post_id])
    post.message = params[:post][:message]
    post.save
    redirect_to thread_path(post.mb_thread_id)
  end

end
