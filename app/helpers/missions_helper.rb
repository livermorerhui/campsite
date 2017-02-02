module MissionsHelper

  def render_mission_status(mission)
    if mission.is_hidden
      content_tag(:span, "", :class => "fa fa-lock")
    else
      content_tag(:span, "", :class => "fa fa-globe")
    end
  end

end
