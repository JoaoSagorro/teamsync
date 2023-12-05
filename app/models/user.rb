class User < ApplicationRecord
  belongs_to :team, dependent: :destroy
  has_many :messages, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    first_name + " " + last_name
  end
end
