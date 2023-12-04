class Player < ApplicationRecord
  belongs_to :team
  has_many :event_players, dependent: :destroy
  has_many :events, through: :event_players
  has_many :notifications
  has_one_attached :photo
  after_update :create_notifications

  HEALTH = %w[Injured Available Limited]

  validates :first_name, :last_name, :position, :birthdate, presence: true
  validates :health, inclusion: { in: HEALTH }
  validates :note, length: { maximum: 1000 }

  def full_name
    "#{first_name} #{last_name}"
  end

  def create_notifications
    if saved_changes.any?
      saved_changes.each do |column, (old_value, new_value)|
        Notification.create(player_id: id, column_name: column, old_value: old_value, new_value: new_value)
      end
    end
  end
end
