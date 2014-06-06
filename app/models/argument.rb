class Argument < ActiveRecord::Base
	validates :conclusion, presence: true
	validates :author, presence: true

	has_many :assumptions
  	has_many :premises, through: :assumptions
	belongs_to :author, class_name: "User"
	belongs_to :conclusion, class_name: "Claim"
	has_many :votes, foreign_key: :voteable_id

	
end
