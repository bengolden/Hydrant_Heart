class Argument < ActiveRecord::Base
  has_many :assumptions#, inverse_of: :argument
  has_many :premises, through: :assumptions
  belongs_to :conclusion, class_name: "Claim"
  belongs_to :author, class_name: "User"
  has_many :votes, foreign_key: :voteable_id

  validates :is_supporting, inclusion: { in: [true, false] }
  validates :author, presence: true
  validates :conclusion, presence: true

  scope :most_recent_first, lambda {
    order("created_at DESC").limit(10)
  }

  def users_supporting
    self.votes.select{|vote| vote.value}.map{|vote| vote.user}
  end

  def users_opposing
    self.votes.select{|vote| !vote.value}.map{|vote| vote.user}
  end

end
