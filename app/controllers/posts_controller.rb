class PostsController < ApplicationController
  def new
  end

  def edit
    if session[:user]
      @post = Post.find(params[:id])
      if session[:user]["id"] == @post.user_id || session[:user]["admin"]
        render :edit
      else
        @message = "Forbidden action"
        render "layouts/message"
      end
    else
      @message = "Forbidden action"
      render "layouts/message"
    end
  end

  def create
    user = User.find(session[:user]["id"])
    user.posts.create(post_params)
    user.increment! :total_posts
    redirect_to location_board_thread_path(params[:location_id],params[:board_id], params[:thread_id])
  end

  def post_params
    params.require(:post).permit(:mb_thread_id, :message)
  end

  def delete
    post = Post.find(params[:post_id])
    if session[:user] && session[:user]["admin"] == 1
      post.destroy
      User.where(id: post.user_id).update_all('total_posts = total_posts - 1')
      redirect_to board_thread_path(params[:board_id], params[:thread_id])
    else
      @message = "Error: Forbidden action"
      render 'layouts/message'
    end
  end

  def update
    post = Post.find(params[:id])
    post.message = params["message"]
    post.save
    #redirect_to board_thread_path(params[:board_id], params[:thread_id])
    render text: ""
  end

end
