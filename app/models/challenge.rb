class Challenge < ApplicationRecord
  has_many :messages
  has_many :dares
  enum category: [ :solo, :friend, :grouped]
  has_one_attached :photo

  validates :name, presence: true, length: { maximum: 50 }
  validates :category, presence: true
  validates :place, presence: true
  validates :content, presence: true
  validates :difficulty, presence: true
  validates :xp, presence: true
  validates :delay, presence: true
  has_one_attached :photo

end
