class My::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @dares = Dare.where(user_id: params[:id])
    @journeys = Journey.where(user_id: params[:id])
  end
end
