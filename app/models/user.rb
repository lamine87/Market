class User < ApplicationRecord
    has_secure_password
    

    # attr_accessor :password, :password_confirmation
    validates :password, presence: true, length: { minimum: 6 }, on: :create
    validates :email, presence: true, uniqueness: true
    # validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "must be a valid email address" }
	validates :prenom, presence: true
	validates :nom, presence: true

end
