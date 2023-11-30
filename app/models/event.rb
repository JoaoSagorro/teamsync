class Event < ApplicationRecord
  belongs_to :team
  has_many :event_players, dependent: :destroy
  has_many :event_employees, dependent: :destroy
  has_many :players, through: :event_players
  has_many :employees, through: :event_employees
  accepts_nested_attributes_for :event_players

  validates :end_date, comparison: { greater_than: :start_date }, presence: true
  validates :location, :title, :description, :start_date, presence: true
end
