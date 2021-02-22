class Dare < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  has_many :journeys
  enum progress: [:pending, :validated, :failed ]
end
