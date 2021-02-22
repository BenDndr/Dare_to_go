class Journey < ApplicationRecord
  belongs_to :user
  belongs_to :dare
  validates :title, length: { maximum: 30 }
  validates :content, presence: true
  validates :challenge_rating, inclusion: { in: %w(0 1 2 3 4 5) }

end
