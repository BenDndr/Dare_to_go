class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :user_level, :lvl

   def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username, :birth_date, :presentation, :address, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :username, :birth_date, :presentation, :address, :photo])
  end

  private

  def user_level
    if user_signed_in? && !current_user.challenges.nil?
      @user_lvl = Level.where("xp_requirement <= ?", current_user.challenges.sum(:xp)).last
    else
      @user_lvl = Level.where("xp_requirement <= ?", 0)
    end
  end

  def lvl
    if current_user.challenges.nil?
      @lvl = 0
    else
      @user_lvl = Level.where("xp_requirement <= ?", current_user.challenges.sum(:xp)).last
      lvl_plus = @user_lvl + 1
      @lvl = (Level.find(lvl_plus).xp_requirement - current_user.challenges.sum(:xp)).fdiv(current_user.challenges.sum(:xp)) * 100
    end
  end
end
