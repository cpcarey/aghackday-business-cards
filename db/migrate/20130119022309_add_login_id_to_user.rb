class AddLoginIdToUser < ActiveRecord::Migration
  def up
    add_column :login_id
  end
  
  def down
    remove_column :login_id
  end 
end
