class User < ActiveRecord::Base
  attr_accessible :login_id, :id
  
  has_one :info
  has_and_belongs_to_many :cards
end
