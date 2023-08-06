class UsersController < ApplicationController
  def index; end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to tweets_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.authenticate(user_params[:password]).present? && user_params[:password] == user_params[:password_confirmation]
      @user.update(
        name: user_params[:name],
        username: user_params[:username],
        email: user_params[:email],
        password: user_params[:new_password]
      )
      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy; end

  def show_likes
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :name, :password, :password_confirmation,
                                 :avatar, :new_password)
  end
end
