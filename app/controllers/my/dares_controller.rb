class My::DaresController < ApplicationController
  def index
    @dares = Dare.where(user_id: current_user)
  end
end
