class MoviesController < ApplicationController
  before_action :movie_params, only: [:show, :new, :edit, :index]

  def index
    @movies = Movie.search(params[:search]).order(:created_at)
  end

  def show
    @movie = Movie.find(movie_params)
  end

  def new
    @movie = Movie.new
    render 'form'
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(movie_params)
    render 'form'
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :duration, :genre)
  end
end
