module ApplicationHelper

  def full_title title
    base_title = "MyStore"
    if title.blank?
      base_title
    else
      "#{base_title} | #{title}"
    end
  end

  def user_image_profile image
    image_tag(image ? image.name.url : "profile_default.png",
    class:"img-circle img-responsive")
  end
end
