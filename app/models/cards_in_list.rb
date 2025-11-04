class CardsInList < ApplicationRecord
  belongs_to :list, foreign_key: true
  belongs_to :card, foreign_key: true
end
