class User < ApplicationRecord
    has_many :assistants

    validates :name, presence: true
    validates :email, presence: true
    validates :password, presence: true
    validates :birthdate, presence: true

    include AsJsonRepresentations

    representation :public do
        {
          id: id,
          name: name,
          email: email,
          phone: phone,
          birthdate: birthdate
        }
    end
    
end
