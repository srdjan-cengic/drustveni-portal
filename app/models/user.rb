class User < ActiveRecord::Base
	belongs_to :user_role
	has_many :entries

	before_save :encrypt_password #callback, another cool part of Active Record;

	attr_accessor :password
	validates :password, confirmation: true
	validates :username, :email, :password, :password_confirmation, presence: true
  	validates :username, :email, uniqueness: true

	# Bussines logic
	def self.authentication(username, password)
		user = User.find_by_username(username)

		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end

	def encrypt_password
		if self.password.present? # Has a value that is not nil, false, empty, or a white space string
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(self.password, self.password_salt)
		end
	end
end
