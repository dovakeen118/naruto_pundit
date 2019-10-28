class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(new_mission_params)
    @mission.user = current_user

    if @mission.save
      redirect_to @mission, notice: "Mission was successfully created!"
    else
      render :new
    end
  end

  def index
    @missions = Mission.all
  end

  def show
  end

  def edit
  end

  def update
    if @mission.update(new_mission_params)
      redirect_to @mission, notice: "Mission was successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @mission.destroy
    redirect_to missions_url, notice: "Mission was successfully deleted!"
  end

  private

  def set_mission
    @mission = Mission.find(params[:id])
  end

  def new_mission_params
    params.require(:mission).permit(:title, :description)
  end
end
