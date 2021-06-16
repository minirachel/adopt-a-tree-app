class Journal < ActiveRecord::Base
    belongs_to :tree_journal
    belongs_to :tree, through: :tree_journal
end