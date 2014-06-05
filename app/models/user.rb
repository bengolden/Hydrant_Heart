class User < ActiveRecord::Base

  has_many :authored_arguments, class_name: "Argument", foreign_key: :author_id, inverse_of: :user
  has_many :authored_claims, class_name: "Claim", foreign_key: :author_id, inverse_of: :user
  has_many :votes, inverse_of: :user


  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
  validates :email, format: { with: /\S+@\w+.\w+/, message: "Improper email format" }
  
  # Add password validations after views created.
  
  has_secure_password
end
