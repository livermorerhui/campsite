class Leader::MissionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @missions = current_user.missions
  end





end
