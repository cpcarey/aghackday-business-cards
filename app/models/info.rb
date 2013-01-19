class Info < ActiveRecord::Base
  attr_accessible :address_line_1, :address_line_2, :email, :first_name, :job_title, :last_name, :logo_url, :organization, :phone_number, :website, :user_id, :card_id
  
  belongs_to :user
  belongs_to :card
end