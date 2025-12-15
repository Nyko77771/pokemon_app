# frozen_string_literal: true

require 'test_helper'

class CardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'Card has no name' do
    card = Card.new(
      name: '',
      set_name: 'set_1',
      card_number: 'number_1',
      card_text: 'text_1',
      rarity: 'rare_1',
      market_price: '1.1',
      image_url: 'https://randomsite.com'
    )
    assert_not card.valid?, 'Invalid: Card is missing name field'
  end

  test 'Card has no set name' do
    card = Card.new(
      name: 'card_1',
      set_name: '',
      card_number: 'number_1',
      card_text: 'text_1',
      rarity: 'rare_1',
      market_price: '1.1',
      image_url: 'https://randomsite.com'
    )
    assert_not card.valid?, 'Invalid: Card is missing set_name field'
  end

  test 'Card has no card number' do
    card = Card.new(
      name: 'card_1',
      set_name: 'set_1',
      card_number: '',
      card_text: 'text_1',
      rarity: 'rare_1',
      market_price: '1.1',
      image_url: 'https://randomsite.com'
    )
    assert_not card.valid?, 'Invalid: Card is missing snumber for the card'
  end

  test 'Card has no text field set' do
    card = Card.new(
      name: 'card_1',
      set_name: 'set_1',
      card_number: 'number_1',
      card_text: '',
      rarity: 'rare_1',
      market_price: '1.1',
      image_url: 'https://randomsite.com'
    )
    assert_not card.valid?, 'Invalid: Card is missing text field'
  end

  test 'Card missing rarity' do
    card = Card.new(
      name: 'card_1',
      set_name: 'set_1',
      card_number: 'number_1',
      card_text: 'text_1',
      rarity: '',
      market_price: '1.1',
      image_url: 'https://randomsite.com'
    )
    assert_not card.valid?, 'Invalid: Card has no rarity'
  end

  test 'Card has no price' do
    card = Card.new(
      name: 'card_1',
      set_name: 'set_1',
      card_number: 'number_1',
      card_text: 'text_1',
      rarity: 'rare_1',
      market_price: '',
      image_url: 'https://randomsite.com'
    )
    assert_not card.valid?, 'Invalid: Card is missing price field'
  end

  test 'Card has no image URL' do
    card = Card.new(
      name: 'card_1',
      set_name: 'set_1',
      card_number: 'number_1',
      card_text: 'text_1',
      rarity: 'rare_1',
      market_price: '1.1',
      image_url: ''
    )
    assert_not card.valid?, 'Invalid: Card is missing image link'
  end

  test 'Card has all the parameters' do
    card = Card.new(
      name: 'card_1',
      set_name: 'set_1',
      card_number: 'number_1',
      card_text: 'text_1',
      rarity: 'rare_1',
      market_price: '1.1',
      image_url: 'https://randomsite.com'
    )
    assert card.valid?, 'Valid: Card has all the fields given'
  end
end
