class RemoveSaltFromUser < ActiveRecord::Migration
  def up
    remove_column :salt
  end

  def down
    add_column :salt
  end
end
