class AddColumnsToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :preferred_side, :string
    add_column :players, :injury_notes, :string
    add_column :players, :nutrition_restrictions, :string
    add_column :players, :expected_return_date, :datetime
  end
end
