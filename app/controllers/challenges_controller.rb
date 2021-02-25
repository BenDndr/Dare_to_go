class ChallengesController < ApplicationController

  def index
    @challenge_sample = []
    @challenges = Challenge.where(category: params[:category]).where(difficulty: 1)
    3.times do
      @challenge_sample << @challenges.sample
    end
    @nb_challenge = []
    @dares = Dare.where(user_id: current_user.id)
    
    @challenge_sample.each do |challenge|
      count = 0
      @dares.each do |dare|
        if dare.challenge_id == challenge.id
          count += 1
        end  
      end
      @nb_challenge << count
    end
    
  end

  def show
    @challenge = Challenge.find(params[:id])
    @users = User.all
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
    @dares = Dare.where(user_id: current_user.id)
    @count = 0
    
    @dares.each do |dare|
      if dare.challenge_id == @challenge.id
        @count += 1
      end
    end
    
  end

  private

  def article_params
    params.require(:article).permit(:name, :category, :place, :content, :difficulty, :xp, :delay, :photo)
  end
end
