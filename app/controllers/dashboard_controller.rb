class DashboardController < ApplicationController
  before_action :authenticate_user!

  def overview
    @submits = Submit.where(user_id: current_user.id).limit(5)
    @badges = current_user.badges
  end
end
