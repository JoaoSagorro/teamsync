class Team < ApplicationRecord
  has_many :user
  has_many :players, dependent: :destroy
  has_many :employees, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :chatrooms, dependent: :destroy
  has_many :team_chatrooms, dependent: :destroy
  has_many :games, dependent: :destroy
  has_many :costs, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :name, :sport, :stadium, :address, :budget, presence: true
end
