class Claim < ActiveRecord::Base
  belongs_to :author, class_name "User"
  # has_many :arguments_towards, foreign_key: :conclusion_id
  # has_many :arguments_from

end
