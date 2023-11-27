class CreateEventEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :event_employees do |t|
      t.references :event, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
