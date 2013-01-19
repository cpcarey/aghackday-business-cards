class SplitAddressForUser < ActiveRecord::Migration
  def up
    add_column :infos, :address_line_1, :string
    add_column :infos, :address_line_2, :string
    remove_column :infos, :address
  end

  def down
    remove_column :infos, :address_line_1
    remove_column :infos, :address_line_2
    add_column :infos, :address, :string
  end
end
