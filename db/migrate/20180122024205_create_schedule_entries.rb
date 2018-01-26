class CreateScheduleEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :schedule_entries do |t|
      t.integer :employee_id
      t.integer :employer_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
