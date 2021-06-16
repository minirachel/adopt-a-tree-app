class User < ActiveRecord::Base
    has_many :trees
    has_many :journals, through: :trees
end