class Notification < ApplicationRecord
  belongs_to :player, optional: true
  belongs_to :team
end
