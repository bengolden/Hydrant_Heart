class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  validates :voteable_type, presence: true
  validates :value, inclusion: { in: [true, false] }
  validates :user, presence: :true
  validates :user, uniqueness: { scope: [:voteable, :voteable_type] }

  # How do we validate the presence of a polymorphic association?
end

