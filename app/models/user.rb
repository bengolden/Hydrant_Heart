require 'bcrypt' # NEEDED??

class User < ActiveRecord::Base

  include BCrypt ## NEEDED??

  has_many :authored_arguments, class_name: "Argument", foreign_key: :author_id
  has_many :authored_claims, class_name: "Claim", foreign_key: :author_id
  has_many :votes


  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
  validates :email, format: { with: /\S+@\w+.\w+/, message: "Improper email format" }


  def password ##TESTING
    @password ||= Password.new(password_hash)
  end

  def password=(new_password) ##TESTING
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
