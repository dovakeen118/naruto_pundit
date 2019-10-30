class UsersController < ApplicationController
  before_action :user_params, only: [:show, :update, :destroy]

  after_action :verify_authorized, except: [:index]

  def index
    @users = User.all
  end

  def show
    authorize @user
  end

  def update
    @user.update(new_user_params)
    authorize @user
    if @user.save
      redirect_to users_path, notice: "User was successfully updated!"
    else
      redirect_to users_path, notice: "Unable to update this user."
    end
  end

  def destroy
    authorize @user
    @user.destroy
    redirect_to root_path, notice: "User was successfully deleted!"
  end

  private

  def user_params
    @user = User.find(params[:id])
  end

  def new_user_params
    params.require(:user).permit(:role)
  end
end
