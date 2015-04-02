class UsersController < ApplicationController
   before_action :set_user, only: [:edit, :update, :show, :destroy ]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to '/', notice: "New user created"
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to '/', notice: "User successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to '/', notice: "User deleted."
  end
  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :username, :bio, :password)
  end

end
