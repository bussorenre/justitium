class DashboardController < ApplicationController
  before_action :authenticate_user!

  def overview
    @submits = Submit.where(user_id: current_user.id).order("created_at DESC").limit(5)
  end
end
