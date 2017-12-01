module ApplicationHelper
  def facebook_image(user)
    avatar_url = user.facebook_picture_url || "https://kitt.lewagon.com/placeholder/users/anyuser"
  end

  def fund_percentage(experience)
    experience.fund.contributions.sum(:amount)/experience.fund.funding_goal.to_f * 100
  end

  def contribution_percentage(trip)
    (trip.contribution.amount)/(trip.experience.fund.funding_goal).to_f * 100
  end

  def total_paid(trip)
    length = (@trip.end_date - @trip.start_date).to_i
    price = @trip.experience.price
    total = length * price
  end

end
  # raised = @experience.fund.contributions.sum(:amount)
    # goal = @experience.fund.funding_goal
    # result = (raised/goal)*100
