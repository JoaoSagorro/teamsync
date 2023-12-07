class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :check_signed_in

  def check_signed_in
  end

  # def after_sign_in_path_for(current_user)
  #   redirect_to team_path(current_user.team) if user_signed_in?
  # end

  def home
    # redirect_to team_path(current_user.team) if user_signed_in?
    if user_signed_in?
      @team = current_user.team
    end
  end
end
