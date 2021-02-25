class My::DaresController < ApplicationController
  before_action :set_dares, only: [:edit, :update, :destroy]
  def index
    @dares = dares.where(user_id: current_user)
  end

  def edit
  end

  def update
    @dares.update(dares_params)
    redirect_to my_dares_path
  end

  def destroy
    @dares.destroy
    redirect_to my_dares_path
  end

  private

  def set_dares
    @dares = Dares.find(params[:id])
  end
end
