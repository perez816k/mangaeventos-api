class User < ApplicationRecord
    has_many :assistants
    
    validates :name, presence: true
    validates :email, presence: true
    validates :password, presence: true
    validates :birthdate, presence: true
end
