class ChangeStartDateTimeEndDateTimeEvents < ActiveRecord::Migration[7.1]
  def change
    change_table :events do |t|
      t.remove :start_date, :end_date, :start_time, :end_time
      t.datetime :start_date
      t.datetime :end_date
    end
  end
end
