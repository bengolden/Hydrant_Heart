class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true
  
  validates :voteable_type, presence: true
  validates :value, inclusion: { in: [true, false] }
end

