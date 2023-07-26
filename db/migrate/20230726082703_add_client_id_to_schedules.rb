class AddClientIdToSchedules < ActiveRecord::Migration[7.0]
  def change
    add_reference :schedules, :client, null: false, foreign_key: true
  end
end
