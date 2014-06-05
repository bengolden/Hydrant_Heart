class Argument < ActiveRecord::Base
  has_many :assumptions
  has_many :premises, through: :assumptions
  belongs_to :conclusion, class_name: "Claim"
  belongs_to :author, class_name: "User"
  has_many :votes, foreign_key: :voteable_id



  validates :is_supporting, inclusion: { in: [true, false] }
  # validates :conclusion, :author, presence: true

end
