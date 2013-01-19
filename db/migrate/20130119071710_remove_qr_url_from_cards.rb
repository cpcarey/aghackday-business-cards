class RemoveQrUrlFromCards < ActiveRecord::Migration
  def up
    remove_column :cards, :qr_url, :string
  end

  def down
    add_column :cards, :qr_url, :string
  end
end
