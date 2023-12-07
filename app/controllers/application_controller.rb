class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(current_user)
    team_path(current_user.team)
  end
end
