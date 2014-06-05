class User < ActiveRecord::Base
  has_secure_password

  has_many :authored_arguments, class_name: "Argument", foreign_key: :author_id
  has_many :authored_claims, class_name: "Claim", foreign_key: :author_id
  has_many :votes

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
  validates :email, format: { with: /\S+@\w+.\w+/, message: "Improper email format" }
end
