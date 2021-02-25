class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages, dependent: :destroy
  has_many :dares, dependent: :destroy
  has_many :journeys, dependent: :destroy
  has_many :challenges, through: :dares
  has_one_attached :photo

  def total_xp
    dares.where(progress: "validated").includes(:challenge).sum(:xp)
  end

  def current_level
    Level.where("xp_requirement <= ?", total_xp).last
  end

  def next_level
    Level.find(current_level.id + 1)
  end

  def lvl_xp_bar
    (total_xp - current_level.xp_requirement).fdiv(next_level.xp_requirement -
    current_level.xp_requirement) * 100
  end
end
