class List < ApplicationRecord
  belongs_to :user
  has_many :cards, through: :cards_in_list
  has_many :cards_in_list, dependent: :destroy
end
