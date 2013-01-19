class RemoveHashedPasswordFromUser < ActiveRecord::Migration
  def up
    remove_column :hashed_password 
  end

  def down
    add_column :hashed_password
  end
end
