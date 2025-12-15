class RemoveDamageAndBooleFromCards < ActiveRecord::Migration[8.0]
  def change
    remove_column :cards, :damage, :string
    remove_column :cards, :boole, :boolean
  end
end
