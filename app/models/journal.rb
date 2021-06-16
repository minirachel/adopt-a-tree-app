class Journal < ActiveRecord::Base
    belongs_to :tree
    belongs_to :user, through: :tree
end