class Feedback < ActiveRecord::Base
  belongs_to :post
  has_many :comments
end
