class Card < ActiveRecord::Base
  attr_accessible :theme
  
  has_one :info
end
