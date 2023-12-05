class AddColumsToCosts < ActiveRecord::Migration[7.1]
  def change
    add_column :costs, :remaining_budget, :decimal
  end
end
