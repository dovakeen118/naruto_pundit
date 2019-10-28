class UsersController < ApplicationController
  before_action :user_params, only: [:show, :destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @users = User.all
  end

  def show
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: "User was successfully deleted!"
  end

  private

  def user_params
    @user = User.find(params[:id])
  end
end
