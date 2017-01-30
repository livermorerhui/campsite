class Admin::MissionsController < ApplicationController
  # admin mission controller

  before_action :set_mission, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  #before_filter :require_is_admin
  before_action :find_mission_and_check_permission, only: [:edit, :update, :destroy]

  # GET /missions
  # GET /missions.json
  def index
    @missions = Mission.all
  end

  # GET /missions/1
  # GET /missions/1.json
  def show
  end

  # GET /missions/new
  def new
    @mission = Mission.new
  end

  # POST /missions
  # POST /missions.json
  def create
    @mission = Mission.new(mission_params)
    @mission.user = current_user

    if @mission.save
      redirect_to admin_missions_path, notice: 'Mission was successfully created.'
    else
      render :new
    end
  end

  # GET /missions/1/edit
  def edit
  end

  # PATCH/PUT /missions/1
  # PATCH/PUT /missions/1.json
  def update
    if @mission.update(mission_params)
      redirect_to admin_missions_path, notice: 'Mission was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /missions/1
  # DELETE /missions/1.json
  def destroy
    @mission.destroy

    redirect_to admin_missions_path, notice: 'Mission was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mission
      @mission = Mission.find(params[:id])
    end
    
    def find_mission_and_check_permission
      if current_user != @mission.user
        redirect_to root_path, alert: "You have no permission."
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mission_params
      params.require(:mission).permit(:title, :description, :location)
    end
end
