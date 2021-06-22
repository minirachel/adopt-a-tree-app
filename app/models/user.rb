class User < ActiveRecord::Base
    has_secure_password
    validates :password, length: {in: 4..20}

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :username, length: {in: 4..20}

    validates :email, presence: true
    validates :email, uniqueness: true
    validates :email, length: {minimum: 8}
    
    has_many :trees
    has_many :journals
end