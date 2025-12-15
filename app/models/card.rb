# frozen_string_literal: true

# Class model for Card
class Card < ApplicationRecord
  # Associations
  has_many :cards, dependent: :destroy
  has_many :lists, through: :cards_in_list

  # Validations for testing purposes
  validates :name, :set_name, :card_number, :card_text, :rarity, :market_price, :image_url, presence: true
end
