class Event < ApplicationRecord
  belongs_to :team
  has_many :event_players, dependent: :destroy
  has_many :event_employees, dependent: :destroy

  validates :end_date, comparison: { greater_than: :start_date }, presence: true
  validates :location, :title, :description, :start_date, presence: true
end
