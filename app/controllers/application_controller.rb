class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :user_level, :lvl, :user_xp

   def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username, :birth_date, :presentation, :address, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :username, :birth_date, :presentation, :address, :photo])
  end

  private

  def user_xp
    Dare.where(user: current_user).where(progress: "validated").includes(:challenge).sum(:xp)
  end

  def user_level
    if user_signed_in? && !current_user.challenges.nil?
      @user_lvl = Level.where("xp_requirement <= ?", user_xp).last
    else
      @user_lvl = Level.where("xp_requirement <= ?", 0)
    end
  end

  def lvl
    if user_signed_in? && !current_user.challenges.nil?
      @user_lvl = Level.where("xp_requirement <= ?", user_xp).last
      lvl_plus = @user_lvl.id + 1
      @lvl = (user_xp - Level.find(@user_lvl.id).xp_requirement).fdiv(Level.find(lvl_plus).xp_requirement - Level.find(@user_lvl.id).xp_requirement) * 100
    else
      @lvl = 0
    end
  end
end

