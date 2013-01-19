class AddQrUrlToCards < ActiveRecord::Migration
  def change
    add_column :cards, :qr_url, :string
  end
end
