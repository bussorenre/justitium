class DashboardController < ApplicationController
  before_action :authenticate_user!

  def overview
    @submits = Submit.limit(5)
  end
end
