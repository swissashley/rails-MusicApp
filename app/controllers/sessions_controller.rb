class SessionsController < ApplicationController
  # before_action :require_no_user!, only: [:create, :new]

  def new
    render :new
  end

  # This is the login method to find the correct session_token
  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["Incorrect Username/Password"]
      render :new
    end
  end

  def destroy
    log_out_user!(current_user)
    redirect_to new_session_url
  end

end
