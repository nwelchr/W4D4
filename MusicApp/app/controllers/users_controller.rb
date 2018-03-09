class UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      flash[:success] = "Successfully signed up!"
      email = UserMailer.welcome_email(@user)
      email.deliver
      redirect_to user_url(@user)
    else
      flash[:error] = "Bad auth credentials"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
