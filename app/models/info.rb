class Info < ActiveRecord::Base
  attr_accessible :address, :email, :first_name, :job_title, :last_name, :logo_url, :organization, :phone_number, :website, :user_id, :card_id
  
  belongs_to :user
  belongs_to :card
end