module ApplicationHelper
  def facebook_image(user)
    avatar_url = user.facebook_picture_url || "https://kitt.lewagon.com/placeholder/users/anyuser"
  end
end
