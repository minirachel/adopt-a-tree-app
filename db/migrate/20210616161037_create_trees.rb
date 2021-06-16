class CreateTrees < ActiveRecord::Migration[6.1]
  def change
    create_table :trees do |t|
      t.string :nickname
      t.string :image
      t.string :tree_map_no
      t.string :species
      t.integer :user_id
      t.integer :journal_id
    end
  end
end
