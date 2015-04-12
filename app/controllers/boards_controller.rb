class BoardsController < ApplicationController
  before_action :store_referrer

  def index
    @boards = Board.all
  end

  def new
  end

  def create
    Board.create(create_board_params)
    @message = "Board created successfully!"
    render "layouts/message"
  end

  def create_board_params
    params.require(:board).permit(:title, :description)
  end

  def show
    @location = Location.find(params[:location_id])
    @board = Board.find(params[:id])
    @threads = MbThread.joins(:user).where(board_id: params[:id]).select("mb_threads.*, users.username AS username").page(params[:page])
  end

  def adminform
    if (session[:user] && session[:user]["admin"] == 1) || (session[:user] && session[:user]["id"] == 1)
      render :adminform
    else
      @message = "You do not have permission"
      render "layouts/message"
    end
  end

  def adminupdate
    if (session[:user] && session[:user]["admin"] == 1) || (session[:user] && session[:user]["id"] == 1)
      user = User.find(params[:user][:id])
      user.admin = params[:user][:level]
      user.save
      @message = "#{user.username} has been granted privilege level #{params[:user][:level]}"
      render "layouts/message"
    else
      @message = "You do not have permission"
      render "layouts/message"
    end
  end

end
