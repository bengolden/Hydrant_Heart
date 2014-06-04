class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true
  validates :email, presence: true

  has_many :authored_arguments, class_name: "Argument", foreign_key: :author_id
  has_many :authored_claims, class_name: "Claim", foreign_key: :author_id
  has_many :votes
end
