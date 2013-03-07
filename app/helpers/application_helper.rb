module ApplicationHelper
  
  def avatar_for(user)
    image_tag user.avatar, :class => 'avatar'
  end

end
