class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :edit, :update, :destroy]

  after_action :verify_authorized

  def new
    @mission = Mission.new
    authorize @mission
  end

  def create
    @mission = Mission.new(new_mission_params)
    @mission.user = current_user

    if @mission.save
      redirect_to @mission, notice: "Mission was successfully created!"
    else
      render :new
    end
    authorize @mission
  end

  def index
    @missions = Mission.all
    authorize @missions
  end

  def show
    authorize @mission
  end

  def edit
    authorize @mission
  end

  def update
    authorize @mission
    if @mission.update(new_mission_params)
      redirect_to @mission, notice: "Mission was successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    authorize @mission
    if @mission.destroy
      redirect_to missions_url, notice: "Mission was successfully deleted!"
    else
      redirect_to @mission, notice: 'You are not authorized to delete this mission!'
    end
  end

  private

  def set_mission
    @mission = Mission.find(params[:id])
  end

  def new_mission_params
    params.require(:mission).permit(:title, :description)
  end
end
