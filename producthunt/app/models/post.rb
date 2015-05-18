class Post < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_many :comments
  has_many :feedbacks

end
