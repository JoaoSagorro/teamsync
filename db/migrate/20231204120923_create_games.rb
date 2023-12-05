class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.date :date
      t.string :location
      t.integer :score
      t.string :outcome
      t.string :opposition
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
