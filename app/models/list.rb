# Class representing a List in the application
class List < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :cards_in_list, dependent: :destroy
  has_many :cards, through: :cards_in_list

  #Validation
  validates :name, presence: true
end
