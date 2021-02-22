class ChallengesController < ApplicationController

  def index
    @challenge_sample = []
    @challenges = Challenge.where(category: params[:category])
    # @challenges = Challenge.where(difficulty: 1)
    
    2.times do 
      @challenge_sample << @challenges.sample
    end 
    
  end
  
  def show
    @challenge = Challenge.find(params[:id])
  end
  

end
