class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.string :first_name
      t.string :last_name
      t.string :organization
      t.string :address
      t.string :phone_number
      t.string :email
      t.string :website
      t.string :job_title
      t.string :logo_url

      t.timestamps
    end
  end
end
