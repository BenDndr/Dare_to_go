class DaresController < ApplicationController
  before_action :set_dare, only: [:show, :accept, :refuse]
  def show

    # authorize @dare
    @challenge = Challenge.find(@dare.challenge.id)
    # @message = Message.new
    # @messages = Message.where(dare_id: @dare.id)
    @deadline = @dare.created_at + @challenge.delay*86400
  end

  def accept
    @dare.progress = 1
    # authorize @dare
    @dare.save
    redirect_to challenge_dare_path(@dare.challenge, @dare)

  end

  def refuse
    @dare.progress = 2
    # authorize @dare
    @dare.save
    redirect_to challenge_dare_path(@dare.challenge, @dare)
  end


  def index
    @dares = Dare.where(user_id: current_user)
    @dares = @dares.where(progress: 1)
  end
  # def new
  #   @challenge = Challenge.find(params[:challenge_id])
  #   @user_challenge = User.find(@challenge.user_id)
  #   @user = current_user
  #   @dare = Challenge.new
  #   # authorize @dare
  # end

  def create
    @dare = Challenge.new(dare_params)
    # authorize @dare
    @challenge = Challenge.find(params[:challenge_id])
    @dare.challenge = @challenge
    @dare.user = current_user
    if
      @dare.save
      redirect_to challenge_dare_path(@dare.challenge, @dare)
    else
      render :new
    end
  end

  private
  def set_dare
    @dare = Dare.find(params[:id])
  end
end
