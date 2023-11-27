class Player < ApplicationRecord
  belongs_to :team
  has_many :event_players, dependent: :destroy

  validates :first_name, :last_name, :position, :birthdate, presence: true
end
