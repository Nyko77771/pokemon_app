# Model representing a user in the application
class User < ApplicationRecord
    # Associations
    has_many :lists, dependent: :destroy
    has_secure_password
end
