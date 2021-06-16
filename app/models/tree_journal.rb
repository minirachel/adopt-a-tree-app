class TreeJournal < ActiveRecord::Base
    belongs_to :journal
    belongs_to :tree
end