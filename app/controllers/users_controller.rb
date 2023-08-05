class UsersController < ApplicationController
  def index; end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to tweets_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update; end

  def destroy; end

  def show_likes
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :name, :password_digest, :password_confirmation)
  end
end
