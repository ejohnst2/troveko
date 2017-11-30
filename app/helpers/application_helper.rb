module ApplicationHelper
  def facebook_image(user)
    avatar_url = user.facebook_picture_url || "https://kitt.lewagon.com/placeholder/users/anyuser"
  end

  def fund_percentage(experience)
    experience.fund.contributions.sum(:amount)/experience.fund.funding_goal.to_f * 100
  end
end
  # raised = @experience.fund.contributions.sum(:amount)
    # goal = @experience.fund.funding_goal
    # result = (raised/goal)*100
