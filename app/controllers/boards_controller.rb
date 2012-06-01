class BoardsController < ApplicationController
  def index
     @boards = Board.all
  end

  def show
     @board = Board.find(params[:id])
     @posts = @board.posts.paginate(:page => params[:page], :per_page => 5)
  end

  def new
     @board = Board.new
  end

  def edit
     @board = Board.find(params[:id])
  end

  def create
     @board = Board.new(params[:board])
     if @board.save
        redirect_to boards_path
     end
  end

  def update
     @board = Board.find(params[:id])
     if @board.update_attributes(params[:board])
        redirect_to board_path(@board)
     end
  end

  def destroy
     @board = Board.find(params[:id])
     @board.destroy
     redirect_to boards_path
  end
end
