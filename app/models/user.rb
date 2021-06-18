class User < ActiveRecord::Base
    has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: true
    
    has_many :trees
    # has_many :journals, through: :trees
end