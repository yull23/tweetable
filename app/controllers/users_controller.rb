class UsersController < ApplicationController
  def index; end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new; end
  def edit; end

  def update; end

  def destroy; end

  def show_likes
    @user = User.find_by(id: params[:id])
  end
end
