class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.string :column_name
      t.string :old_value
      t.string :new_value
      t.string :message
      t.references :player, foreign_key: true
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
