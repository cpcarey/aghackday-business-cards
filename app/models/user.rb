class User < ActiveRecord::Base
  attr_accessible :login_id, :id
  
  has_one :info
end
