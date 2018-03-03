class MoviesController < ApplicationController
  before_action :movie_params, :only [:show, :create, :edit]

  def index
    @movies = Movies.all
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
    params.require(:movie).permit(:name, :duration, :genre)
  end
end
