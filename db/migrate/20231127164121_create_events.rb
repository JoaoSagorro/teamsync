class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.string :description
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
