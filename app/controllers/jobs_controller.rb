class JobsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_job_and_check_permission, only: [:edit, :update, :destroy]


  def new
    @mission = Mission.find(params[:mission_id])
    @job = Job.new
  end

  def create
    @mission = Mission.find(params[:mission_id])
    @job = Job.new(job_params)
    @job.mission = @mission
    @job.user = current_user

    if @job.save
      redirect_to mission_path(@mission)
    else
      render :new
    end
  end

  def show
    @mission = Mission.find(params[:mission_id])
    @job = Job.find(params[:id])
  end

  def edit
  end

  def update

    if @job.update(job_params)
      redirect_to mission_path, notice: "Update Success/更新成功"
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to mission_path, alert: "job Delete/删除成功"
  end

private

  def find_job_and_check_permission
    @mission = Mission.find(params[:mission_id])
    @job = Job.find(params[:id])

    if current_user != @mission.user
      redirect_to mission_path, alert: "You have no permission/非创建者，无权限操作"
    end
  end

  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :people_needed)
  end
end
