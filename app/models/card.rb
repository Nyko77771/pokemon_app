class Card < ApplicationRecord
    has_many :cards, dependent: :destroy
    has_many :lists, through: :cards_in_list

    validates :image_url, presence: true
    validates :name, presence: true
    validates :name, presence: true
end
