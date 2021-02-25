class My::DaresController < ApplicationController
  def index
    @dares = Dare.where(user_id: current_user)
    @dares_pending = @dares.where(progress: "pending")
    @dares_completed = @dares.where(progress: "validated")
  end
end
