class Event < ApplicationRecord
    has_many :assistants
    
    validates :name, presence: true
    validates :description, presence: true
    validates :date, presence: true
    validates :location, presence: true
    validates :price_ti, presence: true
    validates :price_bus, presence: true
end
