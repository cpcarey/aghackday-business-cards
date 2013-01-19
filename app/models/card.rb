class Card < ActiveRecord::Base
  include ApplicationHelper
  
  attr_accessible :theme, :url
  
  has_one :info
end
