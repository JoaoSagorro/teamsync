class AddNoteToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :note, :text
  end
end
