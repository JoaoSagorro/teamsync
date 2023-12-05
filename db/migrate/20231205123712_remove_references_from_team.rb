class RemoveReferencesFromTeam < ActiveRecord::Migration[7.1]
  def change
    remove_reference :teams, :user, null: false, foreign_key: true
  end
end
