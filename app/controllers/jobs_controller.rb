class JobsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

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

  private


    def job_params
      params.require(:job).permit(:title, :description, :people, :wage_lower_bound, :wage_upper_bound)
    end

end
