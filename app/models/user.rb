class User < ActiveRecord::Base
	

	validates_uniqueness_of :email, :username
	validates_presence_of :username, :email

	validates	:password_hash, presence: true

	has_many :votes
	has_many :authored_arguments, class_name: 'Argument', foreign_key: :author_id
	has_many :authored_claims, class_name: 'Claim', foreign_key: :author_id
	# email format test passing without formatting :)


	def password
		@password ||= BCrypt::Password.new(password_hash)
	end

	def password=(pass)
		@password = BCrypt::Password.create(pass)
		self.password_hash = @password
	end


end
