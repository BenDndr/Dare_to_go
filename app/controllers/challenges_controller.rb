class ChallengesController < ApplicationController

  def index
    @challenge_sample = []
    @challenges = Challenge.where(category: params[:category]).where(difficulty: 1)
    3.times do
      @challenge_sample << @challenges.sample
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
    @markers = current_user.geocoded.map do |flat|
      {
        lat: current_user.latitude,
        lng: current_user.longitude
      }
    end
    raise
  end

  private

  def article_params
    params.require(:article).permit(:name, :category, :place, :content, :difficulty, :xp, :delay, :photo)
  end
end
