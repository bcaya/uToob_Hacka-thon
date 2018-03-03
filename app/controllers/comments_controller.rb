class CommentsController < ApplicationController

  before_action :set_movie
  before_action :set_comment, only: [:show, :edit, :update, :destroy]


  def index
    @comments = @movie.comments.all
    
  end

  def show
  end

  def new
    @comment = @movie.comments.new
  end

  def create
  # binding.pry
  if @comment = current_user.comments.create(body: params[:comment][:body], movie_id: @movie.id)
    # @comment = @movie.comments.new(comment_params)
    # binding.pry
      # if @comment.save
      redirect_to movie_comments_path(@movie)
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

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
