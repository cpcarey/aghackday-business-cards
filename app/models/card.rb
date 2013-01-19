class Card < ActiveRecord::Base
  include ApplicationHelper
  
  attr_accessible :theme, :url
  
  has_one :info
  has_and_belongs_to_many :users
end
