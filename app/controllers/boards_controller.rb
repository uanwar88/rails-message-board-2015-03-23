class BoardsController < ApplicationController
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
    @threads = MbThread.joins(:user).where(board_id: params[:id]).select("mb_threads.*, users.username AS username")
    @board = Board.find(params[:id])
  end

end
