class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  has_many :notifications, dependent: :destroy

  validates :content, presence: true

  def sender?(a_user)
    user.id == a_user.id
  end
end
