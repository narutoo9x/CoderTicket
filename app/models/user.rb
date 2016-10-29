class User < ApplicationRecord
	has_secure_password

	validates :name, :email, presence: true, uniqueness: { case_sensitive: false }
	validates :name, length: { maximum: 20 }
	validates :password, length: { minimum: 4 }

end
