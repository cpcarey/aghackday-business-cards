class AddCardIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :card_id, :integer
  end
end
