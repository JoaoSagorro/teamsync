class TeamChatroom < ApplicationRecord
  belongs_to :chatroom
  belongs_to :team
end
