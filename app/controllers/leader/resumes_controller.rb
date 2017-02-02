class Leader::ResumesController < ApplicationController
  before_action :authenticate_user!
  layout 'leader'

  def index
    @mission = Mission.find(params[:mission_id])
    @job = Job.find(params[:job_id])
    @resumes = @job.resumes.order('created_at DESC')

    if @mission != @job.mission
      redirect_to leader_missions_path, alert: "Address is not correct"
    else
      if current_user != @job.user
        redirect_to leader_missions_path, alert: "You have no permission/非创建者，无权限操作"
      end
    end
  end
  
end
