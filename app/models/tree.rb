class Tree < ActiveRecord::Base
    belongs_to :user
    has_many :tree_journals
    has_many :journals, through: :tree_journals
end