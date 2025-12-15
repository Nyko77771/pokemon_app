# frozen_string_literal: true

# Model representing a user in the application
class User < ApplicationRecord
  # Associations
  has_many :lists, dependent: :destroy
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
