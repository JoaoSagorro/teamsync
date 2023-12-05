class Notification < ApplicationRecord
  belongs_to :player, optional: true
  belongs_to :user, optional: true
  belongs_to :message, optional: true
  belongs_to :team
end
