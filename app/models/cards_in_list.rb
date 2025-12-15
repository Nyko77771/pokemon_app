# frozen_string_literal: true

# Model class representing the association between cards and lists
class CardsInList < ApplicationRecord
  # Associations
  belongs_to :list
  belongs_to :card
end
