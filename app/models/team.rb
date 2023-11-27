class Team < ApplicationRecord
  belongs_to :user
  has_many :players
  has_many :employees
  has_many :events

  validates :name, :sport, :stadium, :address, :budget, presence: true
end
