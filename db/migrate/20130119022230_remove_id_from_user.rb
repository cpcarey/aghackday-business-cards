class RemoveIdFromUser < ActiveRecord::Migration
  def up
    remove_column :id
  end

  def down
    add_column :id
  end
end
