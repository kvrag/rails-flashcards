class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = @user.id
      redirect_to user_path(@user)
    else
      @errors = ["Your shit ain't right"]
      render "new"
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to '/'
  end
end
