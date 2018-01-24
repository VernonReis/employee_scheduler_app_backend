class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.integer :auth_level
      t.integer :employer_id
      t.boolean :is_verified

      t.timestamps
    end
  end
end