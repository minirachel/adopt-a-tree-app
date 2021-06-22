class Tree < ActiveRecord::Base
    validates :nickname, presence: true
    validates :species, presence: true

    belongs_to :user
    has_many :journals
end