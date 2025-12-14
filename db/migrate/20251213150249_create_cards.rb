class CreateCards < ActiveRecord::Migration[8.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :set_name
      t.string :card_number
      t.string :damage
      t.string :card_text
      t.string :rarity
      t.string :image_url
      t.float :market_price

      t.timestamps
    end
  end
end
