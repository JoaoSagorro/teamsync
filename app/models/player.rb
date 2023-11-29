class Player < ApplicationRecord
  belongs_to :team
  has_many :event_players, dependent: :destroy
  has_one_attached :photo
  
  HEALTH = %w[Injured Available Limited]

  validates :first_name, :last_name, :position, :birthdate, presence: true
  validates :health, inclusion: { in: HEALTH }
end
