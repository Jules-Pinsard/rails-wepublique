class AddUserToNotif < ActiveRecord::Migration[7.1]
  def change
    add_reference :notifications, :user
  end
end
