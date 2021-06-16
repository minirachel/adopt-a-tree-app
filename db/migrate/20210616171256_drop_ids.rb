class DropIds < ActiveRecord::Migration[6.1]
  def change
    remove_column :journals, :tree_id, :integer
    remove_column :trees, :journal_id, :integer
  end
end
