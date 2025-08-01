module ApplicationHelper
  def alert_class(type, soft = false)
    case type.to_sym
    when :notice then "alert-success"
    when :alert  then "alert-danger"
    else "alert-info"
    end
  end

  def alert_icon(type)
    case type.to_sym
    when :notice then "fa-circle-check"
    when :alert  then "fa-triangle-exclamation"
    else "fa-info-circle"
    end
  end
end
