class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :id
      t.string :hashed_password
      t.string :salt

      t.timestamps
    end
  end
end
