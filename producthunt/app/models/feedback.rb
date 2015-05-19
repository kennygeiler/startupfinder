class Feedback < ActiveRecord::Base
  acts_as_votable
  belongs_to :post
  has_many :comments
end
