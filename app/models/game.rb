class Game < ApplicationRecord
  belongs_to :team
  validates :location, presence: true
  validates :outcome, presence: true
end
