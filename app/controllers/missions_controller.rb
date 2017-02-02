class MissionsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :find_mission_and_check_permission, only: [:edit, :update, :destroy]

  def index
    @missions = Mission.where(:is_hidden => false).order("created_at DESC")
  end

  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(mission_params)
    @mission.user = current_user

    if @mission.save
      redirect_to missions_path
    else
      render :new
    end
  end

  def show
    @mission = Mission.find(params[:id])
      if @mission.is_hidden
        flash[:warning] = "This Mission already archieved"
        redirect_to root_path
      end
    @jobs = case params[:order]
            when 'by_lower_bound'
              @mission.jobs.published.order('wage_lower_bound DESC')
            when 'by_upper_bound'
              @mission.jobs.published.order('wage_upper_bound DESC')
            else
              @mission.jobs.published.recent
            end
  end

  def edit
  end

  def update
    if @mission.update(mission_params)
      redirect_to missions_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @mission.destroy
    redirect_to missions_path, alert: "Mission deleted"
  end

 private

  def find_mission_and_check_permission
    @mission = Mission.find(params[:id])

    if current_user != @mission.user
      redirect_to root_path, alert: "You have no permission."
    end
  end

  def mission_params
    params.require(:mission).permit(:title, :description, :location, :contact_email, :is_hidden)
  end
end
