class Post < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_many :comments
  has_many :feedbacks

  def score
    self.get_upvotes.sum(:vote_weight)
  end

end
