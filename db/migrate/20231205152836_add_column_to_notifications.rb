class AddColumnToNotifications < ActiveRecord::Migration[7.1]
  def change
    add_reference :notifications, :user, foreign_key: true
    add_reference :notifications, :message, foreign_key: true
  end
end
