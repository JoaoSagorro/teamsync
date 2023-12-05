class AddTeamIdToCosts < ActiveRecord::Migration[7.1]
  def change
    add_reference :costs, :team, foreign_key: true
  end
end
