class CommentsController < ApplicationController

  before_action :set_movie, except: [:index, :show, :new, :create] # Reid put the except part in. Remove if it's broken.
  before_action :set_comment, only: [:show, :edit, :update, :destroy]


  def index
    @comment = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @movie.comments.new(comment_params)
      if @comment.save
        redirect_to [@movie, @comment]
      else
        render :new
      end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to [@movie, @comment]
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to [@movie, @comment]
  end


  private

  def comment_params
    params.require(:comment).permit(:user_id, :movie_id, :body)

  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_song
    @comment = Comment.find(params[:id])
  end
end
