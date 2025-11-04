class CreateCardsInLists < ActiveRecord::Migration[8.0]
  def change
    create_table :cards_in_lists do |t|
      t.references :list, null: false, foreign_key: true
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
