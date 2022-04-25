class UsersController < ApplicationController
  # before_action :logged_in_user, only: [index, edit, update]
  # before_action :correct_user, only:[edit, update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def add
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def get_user
      @user = User.find_by_id(params[:id])
      return if @user
      flash[:warning] = "That publisher could not be found"
      redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
        :password_confirmation, :is_admin)
    end
end
