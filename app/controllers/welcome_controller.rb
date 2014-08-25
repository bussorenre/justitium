class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to dashboard_path
    else 
      redirect_to new_user_session_path, :alert => "please sign in first."
    end
  end
end
