class User < ActiveRecord::Base
  has_many :authored_arguments, class_name: "Argument", foreign_key: :author_id
  has_many :authored_claims, class_name: "Claim", foreign_key: :author_id
  has_many :votes
end
