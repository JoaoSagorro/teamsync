class CreateCosts < ActiveRecord::Migration[7.1]
  def change
    create_table :costs do |t|
      t.date :date
      t.string :description
      t.decimal :amount

      t.timestamps
    end
  end
end
