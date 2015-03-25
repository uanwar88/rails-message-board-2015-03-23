class ThreadsController < ApplicationController
  helper ThreadsHelper

  def show
   #@thread =  MbThread.find(params[:id])
    #@posts = @thread.posts
   @posts = Post.joins(:user).joins(:mb_thread).where(mb_thread_id: params[:id]).select("posts.*, users.username AS username, users.total_posts
   AS total_posts, mb_threads.title AS post_title").order(created_at: :asc)
   @board = Board.find(params[:board_id])
  end

  def create
    @board = Board.find(params[:id])
    user = User.find(session[:user]["id"])
    thread = user.mb_threads.create(thread_params(params[:id]))
    user.posts.create(post_params(thread.id))
    user.increment!(:total_posts)
    redirect_to thread_path(params[:id], thread)
  end

  def new
  end

  def thread_params(board_id)
    params[:mb_thread][:board_id] = board_id
    params.require(:mb_thread).permit(:title, :board_id)
  end

  def post_params(thread_id)
    params[:mb_thread][:message]
    params[:mb_thread][:mb_thread_id] = thread_id
    params.require(:mb_thread).permit(:message, :mb_thread_id)
  end

  def delete
    if session[:user] && session[:user][:admin] == 1
      thread = MbThread.find(params[:id])
      thread.destroy
      User.where(id: thread.user_id).update_all('total_posts = total_posts - 1')
      redirect_to "/boards/#{params[:board_id]}"
    else
      @message = "Error: Forbidden action"
      render 'layouts/message'
    end
  end

end
