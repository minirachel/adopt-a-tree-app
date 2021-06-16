class TreeJournals < ActiveRecord::Migration[6.1]
  def change
    create_table :tree_journals do |t|
      t.integer "tree_id"
      t.integer "journal_id"
    end
  end
end
