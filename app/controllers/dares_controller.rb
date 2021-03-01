class DaresController < ApplicationController
  before_action :set_dare, only: [:show, :accept, :refuse]

  def show
    @dares_attendees = Dare.where(id: params[:id])
    @attendees = @dares_attendees.map { |dare|  User.find(dare.user_id) }
    # authorize @dare
    @challenge = Challenge.find(@dare.challenge.id)
    # @message = Message.new
    # @messages = Message.where(dare_id: @dare.id)
    @deadline = @dare.created_at + @challenge.delay*86400
    @chatroom = Chatroom.find_by(challenge_id: @challenge.id)

    @users = User.where(id: current_user.id)
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
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
  #
  def new

    @challenge = Challenge.find(params[:challenge_id])
    @user = current_user
    @dare = Dare.new
    # @chatroom = Chatroom.new()
    # authorize @dare
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @dare = Dare.new
    # authorize @dare
    @challenge = Challenge.find(params[:challenge_id])
    @chatroom = Chatroom.new(name: @challenge.name, challenge_id: @challenge.id)
    @dare.challenge = @challenge
    @dare.user = current_user
    if
      @dare.save
      @chatroom.save
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
