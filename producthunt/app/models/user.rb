class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :comments
  acts_as_voter

  def increase_karma(count)
    update_attribute(:karma, karma + count)
  end

  def vote_weight_score
    if self.karma < 50
      return 1
    elsif 50 < self.karma && self.karma < 150
      return 3
    else
      return 5
    end
  end

end
