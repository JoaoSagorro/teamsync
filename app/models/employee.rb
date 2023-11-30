class Employee < ApplicationRecord
  belongs_to :team
  has_many :event_employees, dependent: :destroy
  has_many :events, through: :event_employees

  validates :first_name, :last_name, :role, :birthdate, presence: true
end
