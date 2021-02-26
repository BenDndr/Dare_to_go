class JourneysController < ApplicationController

  def index
    @journeys = Journey.where(public: true)
  end

  def new
    @challenge = Challenge.find(params[:challenge_id])
    @dare = Dare.find(params[:dare_id])
    @journey = Journey.new
  end

  def create
    @journey = Journey.new(journey_params)
    @challenge = Challenge.find(params[:challenge_id])
    @dare = Dare.find(params[:dare_id])
    @journey.user = current_user
    @journey.dare = @dare
    if @journey.save
      redirect_to my_dares_path(current_user)
    else
      render new
    end
  end

  def show
    @journey = Journey.find(params[:id])
  end

  private

  def journey_params
    params.require(:journey).permit(:title, :content, :public, :challenge_rating)
  end

end
