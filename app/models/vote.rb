class Vote < ActiveRecord::Base

	belongs_to :user
	belongs_to :voteable, polymorphic: :true

	validates_presence_of :user
	validates_presence_of :voteable_type

end
