class Assumption < ActiveRecord::Base
	belongs_to :premise, class_name: "Claim"
	belongs_to :argument

	validates :argument, presence: true
	validates :premise, presence: true
end