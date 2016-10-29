class User < ApplicationRecord
	has_secure_password

	has_many :events
	has_many :tickets

	validates :name, :email, presence: true, uniqueness: { case_sensitive: false }
	validates :name, length: { maximum: 20 }
	validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
	validates :password, length: { minimum: 4 }

end
