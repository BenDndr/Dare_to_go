class ChallengesController < ApplicationController

  def index
    @challenge_sample = []
    @challenges = Challenge.where(category: params[:category]).where(difficulty: 1)
    3.times do
      @challenge_sample << @challenges.sample
    end
    @markers = {
        lat: 48.8648482,
        lng: 2.3798534
      }
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:name, :category, :place, :content, :difficulty, :xp, :delay, :photo)
  end
end
