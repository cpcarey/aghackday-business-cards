class CreateCardsUsersTable < ActiveRecord::Migration
  def up
    remove_column :cards, :card_id, :integer
    remove_column :cards, :user_id, :integer
    create_table :cards_users, :id => false do |t|
        t.references :card
        t.references :user
    end
    add_index :cards_users, [:card_id, :user_id]
    add_index :cards_users, [:user_id, :card_id]
  end

  def down
    drop_table :cards_users
    add_column :cards, :card_id, :integer
    add_column :cards, :user_id, :integer
  end
end
