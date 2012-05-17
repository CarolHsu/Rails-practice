class PostsController < ApplicationController
  before_filter :find_board
  before_filter :authenticate_user!, :except => [:index, :show]
  def index
     redirect_to board_path(@board)
  end

  def show
     @post = @board.posts.find(params[:id])
  end

  def new
     @post = @board.posts.build
  end

  def edit
     @post = @board.posts.find(params[:id])
  end

  def create
     @post = @board.posts.build(params[:post])
     if @post.save
        redirect_to board_posts_path(@board)
     end
  end

  def update
     @post = @board.posts.find(params[:id])
     if @post.update_attributes(params[:post])
        redirect_to board_post_path(@board, @post)
     end
  end

  def destroy
     @post = @board.posts.find(params[:id])
     @post.destroy
     redirect_to board_posts_path(@board)
  end
  protected
  def find_board
     @board = Board.find(params[:board_id])
  end
end
