class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :theme

      t.timestamps
    end
  end
end
