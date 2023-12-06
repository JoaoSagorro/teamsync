class Employee < ApplicationRecord
  belongs_to :team
  has_many :event_employees, dependent: :destroy
  has_many :events, through: :event_employees

  validates :first_name, :last_name, :role, :birthdate, presence: true

  def employee_full_name
    first_name + " " + last_name
  end

  include PgSearch::Model
  multisearchable against: %i[first_name last_name role]
end
