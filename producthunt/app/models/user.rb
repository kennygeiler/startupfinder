class User < ActiveRecord::Base
  has_merit
  has_secure_password
  has_many :posts
  has_many :comments
  acts_as_voter

  def increase_karma(count)
    update_attribute(:karma, karma + count)
  end

end
