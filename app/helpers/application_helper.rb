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
      "Dashboard"
    else
      ""
    end
  end
end
