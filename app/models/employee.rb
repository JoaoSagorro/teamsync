class Employee < ApplicationRecord
  belongs_to :team
  has_many :event_employees, dependent: :destroy

  validates :first_name, :last_name, :role, :birthdate, presence: true
end
