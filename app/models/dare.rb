class Dare < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  has_many :journeys, dependent: :destroy
  enum progress: [:pending, :validated, :failed ]
end
