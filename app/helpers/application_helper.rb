module ApplicationHelper
  def facebook_image(user)
    avatar_url = user.facebook_picture_url || "https://via.placeholder.com/50x50"
  end

  def fund_percentage(experience)
    (experience.fund.contributions.sum(:amount_cents).to_f / experience.fund.funding_goal_cents.to_f) * 100
  end

  def contribution_percentage(trip)
    (trip.contribution.amount_cents.to_f / trip.experience.fund.funding_goal_cents.to_f) * 100
  end

end
  # raised = @experience.fund.contributions.sum(:amount)
    # goal = @experience.fund.funding_goal
    # result = (raised/goal)*100
