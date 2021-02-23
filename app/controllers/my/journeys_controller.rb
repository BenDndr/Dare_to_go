class My::JourneysController < ApplicationController
  
  def index
    @journeys = Journey.where(user_id: current_user)
  end

  def edit
    @journey = Journey.find(params[:id])
  end

  def update
    @journey = Journey.find(params[:id])
    @journey.update(journey_params)
    redirect_to my_journeys_path
  end
  
  def destroy
    @journey = Journey.find(params[:id])
    @journey.destroy
    redirect_to my_journeys_path
  end
  
  private

  def journey_params
    params.require(:journey).permit(:title, :content, :public, :challenge_rating)
  end
  
end
