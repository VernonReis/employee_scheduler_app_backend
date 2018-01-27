class CreatePayPeriods < ActiveRecord::Migration[5.2]
  def change
    create_table :pay_periods do |t|
      t.datetime :start_date
      t.integer :employer_id

      t.timestamps
    end
  end
end
