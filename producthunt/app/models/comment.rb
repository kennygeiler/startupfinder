class Comment < ActiveRecord::Base
  acts_as_votable
  belongs_to :feedback
  belongs_to :user

  def score
    self.get_upvotes.size
  end

end
