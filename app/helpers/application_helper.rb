module ApplicationHelper
  def flash_class(type)
    case type
    when :alert
      "alert alert-danger"
    when :notice
      "alert alert-success"
    else
      ""
    end  
  end

  def body_class(current_user)
    if current_user
      "sign_in"
    else
      ""
    end
  end

  def controller_action(controller)
    action = controller.controller_name+"#"+controller.action_name

    case action
    when "cargas#index"
      "Rutas"
    when "dashboard#index"
      "Dashboard"
    else
      ""
    end
  end

  def is_active?(link_path)
    if url_for(link_path).include? params[:controller] or current_page?(link_path)
      "active"
    else
      ""
    end
  end
end
