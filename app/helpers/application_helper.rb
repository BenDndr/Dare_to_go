module ApplicationHelper
  def avatar_navbar(element)
    if element.photo.attached?
      cl_image_tag(element.photo.key,width: 150, height: 150, crop: :thumb, gravity: :face, class: "avatar dropdown-toggle", id: "navbarDropdown", data: { toggle: "dropdown" }, 'aria-haspopup': true, 'aria-expanded': false)
    else
      image_tag("avatar-placeholder.png", class: "avatar dropdown-toggle", id: "navbarDropdown", data: { toggle: "dropdown" }, 'aria-haspopup': true, 'aria-expanded': false)
    end
  end
end
