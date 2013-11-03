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
end
