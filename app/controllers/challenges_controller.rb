class ChallengesController < ApplicationController

  private

  def article_params
    params.require(:article).permit(:name, :category, :place, :content, :difficulty, :xp, :delay, :photo)
  end
end
