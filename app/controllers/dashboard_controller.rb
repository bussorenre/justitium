class DashboardController < ApplicationController
  def overview
    @submits = Submit.limit(5)
  end
end
