class CreatePriveleges < ActiveRecord::Migration[5.2]
  def change
    create_table :priveleges do |t|
      t.integer :user_id
      t.integer :auth_level

      t.timestamps
    end
  end
end
