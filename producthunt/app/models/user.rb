class User < ActiveRecord::Base
  has_merit
  has_secure_password
  has_many :posts
  has_many :comments
  acts_as_voter
end
