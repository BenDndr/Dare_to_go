class UsersController < ApplicationController

  def index
    @users = User.all
    # current_user.current_level.rank  current_user.current_level.id 
    @users_sorted = @users.sort_by{ |user| user.total_xp}.reverse.first(10)
    
  end

end
