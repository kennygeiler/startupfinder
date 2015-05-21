class Post < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_many :comments
  has_many :feedbacks

  def score
    self.get_upvotes.sum(:vote_weight)
  end

  def self.today
    where("updated_at >= ?", Time.zone.now.beginning_of_day)
  end

  def self.week
    where("updated_at >= ?", Time.zone.now.beginning_of_week)
  end

  def self.month
    where("updated_at >= ?", Time.zone.now.beginning_of_month)
  end

end
