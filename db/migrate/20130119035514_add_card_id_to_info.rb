class AddCardIdToInfo < ActiveRecord::Migration
  def change
    add_column :infos, :card_id, :integer
  end
end
