class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages, dependent: :destroy
  has_many :dares, dependent: :destroy
  has_many :journeys, dependent: :destroy
  has_many :challenges, through: :dares
  has_one_attached :photo
end
