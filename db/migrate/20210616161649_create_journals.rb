class CreateJournals < ActiveRecord::Migration[6.1]
  def change
    create_table :journals do |t|
      t.date :journal_time 
      t.string :activities
      t.date :date_watered
      t.string :health_rating
      t.string :litter_rating
      t.string :notes
      t.integer :tree_id
    end
  end
end

