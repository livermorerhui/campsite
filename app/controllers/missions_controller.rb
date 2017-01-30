class MissionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def index
    @missions = Mission.all
  end

  def show
    @mission = Mission.find(params[:id])
  end

  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(mission_params)

    if @mission.save
      redirect_to missions_path
    else
      render :new
    end
  end

  def edit
    @mission = Mission.find(params[:id])
  end

  def update
    @mission = Mission.find(params[:id])
    if @mission.update(mission_params)
      redirect_to missions_path
    else
      render :edit
    end
  end

  def destroy
    @mission = Mission.find(params[:id])

    @mission.destroy

    redirect_to missions_path
  end

 private
  def mission_params
    params.require(:mission).permit(:title, :description, :location)
  end
end
