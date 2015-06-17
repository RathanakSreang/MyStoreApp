module ApplicationHelper

  def full_title title
    base_title = "MyStore"
    if title.blank?
      base_title
    else
      "#{base_title} | #{title}"
    end
  end

  def controller?(*controller)
    controller.include?(params[:controller])
  end
 
  def action?(*action)
     action.include?(params[:action])
  end
end
