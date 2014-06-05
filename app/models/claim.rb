class Claim < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :arguments_where_conclusion, class_name: "Argument", foreign_key: :conclusion_id
  has_many :assumptions_where_premise, class_name: "Assumption", foreign_key: :premise_id
  has_many :arguments_where_premise, through: :assumptions_where_premise, source: :argument
  has_many :votes, foreign_key: :voteable_id


  validates :body, presence: true, length: { maximum: 140, too_long: "Its like Twitter, only 140 characters per claim.  That's fun!"}
end
