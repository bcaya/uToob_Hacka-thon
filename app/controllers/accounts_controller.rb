class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: [:add_movie, :add_movie_to, :show, :edit, :update, :destroy]
  before_action :set_acc_movie_id, only: [:add_movie_to]

  def index
    @movies = Movie.all
    @accounts = current_user.accounts
  end

  def show
    @movies = Movie.all
    @array = @account.movie_titles
  end

  def new
    @account = Account.new
  end

  def add_movie
    @movies = Movie.all
    @account = Account.find(params[:id])
  end

  def add_movie_to
    @movies = Movie.all
    @account.movie_titles = "#{@account.movie_titles}, #{@movie.id}"
    @array = @account.movie_titles
    @a = @array.split(",")
    @account.movie_titles = @a.join(",")
    @account.save
    render :show
  end

  def edit
  end

  def create
    @account = current_user.accounts.new(account_params)
    if @account.save
      redirect_to accounts_path
    else
      render :new
    end
  end

  def update
    if @account.update(account_params)
      redirect_to accounts_path
    else
      render :edit
    end
  end

  def destroy
    @account.destroy
    redirect_to accounts_path
  end

  private
  def set_acc_movie_id
    @account = Account.find(params[:a])
    @movie = Movie.find(params[:m])
  end
  def set_account
    #don't just users Account.find(params[:id]) or you would be able to view
    #others accounts
    @account = current_user.accounts.find(params[:id])
  end
  def set_movie
    @movie = Movie.find(params[:id])
  end
  def account_params
    params.require(:account).permit(:name)
  end
end
