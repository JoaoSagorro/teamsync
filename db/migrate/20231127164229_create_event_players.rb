class CreateEventPlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :event_players do |t|
      t.references :event, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
