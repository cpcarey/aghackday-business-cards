class User < ActiveRecord::Base
  attr_accessible :hashed_password, :id, :salt
end
