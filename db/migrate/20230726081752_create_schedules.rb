class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
