class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :check_signed_in

  def check_signed_in
  end

  def home
    redirect_to team_path(current_user.team) if user_signed_in?
  end
end
