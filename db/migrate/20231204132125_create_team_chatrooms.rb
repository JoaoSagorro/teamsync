class CreateTeamChatrooms < ActiveRecord::Migration[7.1]
  def change
    create_table :team_chatrooms do |t|
      t.references :team, null: false, foreign_key: true
      t.references :chatroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end