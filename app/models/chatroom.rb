class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :team
  has_many :team_chatrooms, dependent: :destroy
end
