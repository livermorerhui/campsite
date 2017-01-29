class MissionsController < ApplicationController

  def index
    @mission = Mission.all
  end

  def show
    @mission = Mission.find(params[:id])
  end
end
