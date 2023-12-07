class Event < ApplicationRecord
  belongs_to :team
  has_many :event_players, dependent: :destroy
  has_many :event_employees, dependent: :destroy
  has_many :players, through: :event_players
  has_many :employees, through: :event_employees
  accepts_nested_attributes_for :event_players

  OPPONENTS = {
    "Arsenal" => "https://resources.premierleague.com/premierleague/badges/rb/t3.svg",
    "Aston Villa" => "https://resources.premierleague.com/premierleague/badges/rb/t7.svg",
    "Bournemouth" => "https://resources.premierleague.com/premierleague/badges/rb/t91.svg",
    "Brentford" => "https://resources.premierleague.com/premierleague/badges/rb/t94.svg",
    "Brighton & Hove Albion" => "https://resources.premierleague.com/premierleague/badges/rb/t36.svg",
    "Burnley" => "https://resources.premierleague.com/premierleague/badges/rb/t90.svg",
    "Chelsea" => "https://resources.premierleague.com/premierleague/badges/rb/t8.svg",
    "Crystal Palace" => "https://resources.premierleague.com/premierleague/badges/rb/t31.svg",
    "Everton" => "https://resources.premierleague.com/premierleague/badges/rb/t11.svg",
    "Fulham" => "https://resources.premierleague.com/premierleague/badges/rb/t54.svg",
    "Luton Town" => "https://resources.premierleague.com/premierleague/badges/rb/t102.svg",
    "Manchester City" => "https://resources.premierleague.com/premierleague/badges/rb/t43.svg",
    "Manchester United" => "https://resources.premierleague.com/premierleague/badges/rb/t1.png",
    "Newcastle United" => "https://resources.premierleague.com/premierleague/badges/rb/t4.png",
    "Nottingham Forest" => "https://resources.premierleague.com/premierleague/badges/rb/t17.svg",
    "Sheffield United" => "https://resources.premierleague.com/premierleague/badges/rb/t49.svg",
    "Tottenham Hotspur" => "https://resources.premierleague.com/premierleague/badges/rb/t6.svg",
    "West Ham United" => "https://resources.premierleague.com/premierleague/badges/rb/t21.svg",
    "Wolverhampton Wanderers" => "https://resources.premierleague.com/premierleague/badges/rb/t39.svg"
  }

  EVENT_TYPE = %w[Match Meeting Gym Training Physio Other]

  validates :end_date, comparison: { greater_than: :start_date }, presence: true
  validates :location, :title, :description, :start_date, presence: true
  # validates :opposition, inclusion: { in: OPPONENTS.keys }
  validates :event_type, inclusion: { in: EVENT_TYPE }

  validate :opposition_presence_for_match_event

  include PgSearch::Model
  multisearchable against: %i[opposition event_type title]

  def opposition_presence_for_match_event
    if event_type == "Match" && !opposition.present?
      errors.add(:opposition, "is required for match events")
    end
  end

  def start_time
    self.start_date
  end

  def end_time
    self.end_date
  end
end
