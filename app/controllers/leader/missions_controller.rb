class Leader::MissionsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :find_mission_and_check_permission, only: [:show, :edit, :update, :destroy]

  def index
    @missions = current_user.missions
  end

  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(mission_params)
    @mission.user = current_user

    if @mission.save
      redirect_to leader_missions_path, notice: "Cretae Success"
    else
      render :new
    end
  end

  def show
    @jobs = @mission.jobs
  end

  def edit
  end

  def update
    if @mission.update(mission_params)
      redirect_to leader_missions_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @mission.destroy
    redirect_to leader_missions_path, alert: "Mission deleted"
  end

 private

  def find_mission_and_check_permission
    @mission = Mission.find(params[:id])

    if current_user != @mission.user
      redirect_to leader_missions_path, alert: "You have no permission."
    end
  end

  def mission_params
    params.require(:mission).permit(:title, :description, :location)
  end

end
