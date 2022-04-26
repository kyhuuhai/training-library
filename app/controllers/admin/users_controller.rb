class Admin::UsersController < ApplicationController
  
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
    @user = User.find_by_id(params[:id])
    if @user.update(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to admin_users_path
    else
      render :show
    end
  end


  def add
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Library!"
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def get_user
      @user = User.find_by_id(params[:id])
      return if @user
      flash[:warning] = "That publisher could not be found"
      redirect_to admin_users_path
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to admin_users_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
        :password_confirmation, :is_admin)
    end
end
