class SessionsController < ApplicationController
  # skip_before_action :authenticate_user
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      redirect_to user_path(user)
    else
      flash.now[:message] = "Invalid credentials"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
