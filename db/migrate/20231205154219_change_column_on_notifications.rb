class ChangeColumnOnNotifications < ActiveRecord::Migration[7.1]
  def change
    remove_column :notifications, :message
    add_column :notifications, :note, :string
  end
end
