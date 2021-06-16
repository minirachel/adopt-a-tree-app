class Tree < ActiveRecord::Base
    has_many :journals
    belongs_to :user
end