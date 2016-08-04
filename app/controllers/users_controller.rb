class UsersController < ApplicationController
  # before_action :require_no_user!, only: [:create, :new]

  def new
    @user = User.new
    render :new
  end

  # This is a sign up method, called from New form. After we create an user, we log him in.
  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :session_token)
  end
end
