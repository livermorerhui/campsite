module MissionsHelper

  def render_mission_status(mission)
    if mission.is_hidden
      "(Hidden)"
    else
      "(Public)"
    end
  end

end
