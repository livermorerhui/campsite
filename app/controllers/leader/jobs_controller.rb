class Leader::JobsController < ApplicationController
  
  before_filter :authenticate_user!
  before_action :find_job_and_check_permission, only: [:edit, :update, :destroy, :publish, :hide]
  before_action :find_job_and_check_permission2, only: [:new, :create]
  layout "leader"

  #def index
    #@jobs = current_user.jobs
  #end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.mission = @mission
    @job.user = current_user

    if @job.save
      redirect_to leader_mission_path(@mission), notice: "Cretae Success"
    else
      render :new
    end
  end

  def show
    @mission = Mission.find(params[:mission_id])
    @job = Job.find(params[:id])

    if @mission != @job.mission
      redirect_to leader_mission_path(@mission), alert: "Address is not correct"
    end

    if current_user != @job.user
      redirect_to leader_mission_path(@mission), alert: "You have no permission/非创建者，无权限操作"
    end

  end

  def edit
  end

  def update

    if @job.update(job_params)
      redirect_to leader_mission_path(@mission), notice: "Update Success/更新成功"
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to leader_mission_path(@mission), alert: "Job Delete/删除成功"
  end

  def publish
    @job.publish!
    redirect_to :back
  end

  def hide
    @job.hide!
    redirect_to :back
  end
  private

    def find_job_and_check_permission
      @mission = Mission.find(params[:mission_id])
      @job = Job.find(params[:id])

      if current_user != @job.user
        redirect_to leader_mission_path(@mission), alert: "You have no permission/非创建者，无权限操作"
      end
    end

    def find_job_and_check_permission2
      @mission = Mission.find(params[:mission_id])

      if current_user != @mission.user
        redirect_to leader_mission_path(@mission), alert: "You have no permission/非创建者，无权限操作"
      end
    end

    def job_params
      params.require(:job).permit(:title, :description, :people, :wage_lower_bound, :wage_upper_bound, :is_hidden)
    end

end
