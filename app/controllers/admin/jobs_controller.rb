class Admin::JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :find_job_and_check_permission, only: [:edit, :update, :destroy]

 def index
    @jobs = case params[:order]
            when 'by_lower_bound'
              Job.published.order('wage_lower_bound DESC')
            when 'by_upper_bound'
              Job.published.order('wage_upper_bound DESC')
            else
              Job.published.order('created_at DESC')
            end
 end

 def new
   @job = Job.new
 end

 def create
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
    if @job.is_hidden
      flash[:warning] = "This Job already archieved"
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      rediretc_to jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job.destroy

    redirect_to mission_path(@mission)
  end

private
  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :contact_phone)
  end

    def set_job
      @job = Job.find(params[:mission_id])
    end

    def find_job_and_check_permission
      if current_user != @job.user
        redirect_to jobs_path, alert: "You have no permission."
      end
    end
end
