class DashboardController < ApplicationController
  before_action :authenticate_user!

  def overview
    @submits = Submit.order("created_at DESC").limit(5)
  end
end
