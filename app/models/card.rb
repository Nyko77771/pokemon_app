# Class model for Card
class Card < ApplicationRecord
    # Associations
    has_many :cards, dependent: :destroy
    has_many :lists, through: :cards_in_list

    # Validations for testing purposes
    validates :image_url, presence: true
    validates :name, presence: true
    validates :name, presence: true
end
