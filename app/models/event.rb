class Event < ApplicationRecord
    has_many :assistants

    validates :name, presence: true
    validates :description, presence: true
    validates :date, presence: true
    validates :location, presence: true
    validates :price_ti, presence: true
    validates :price_bus, presence: true

    include AsJsonRepresentations

    representation :public do
        {
          id: id,
          name: name,
          description: description,
          date: date,
          location: location,
          address: address,
          price_ti: price_ti,
          price_bus: price_bus,
          state: state
        }
    end
end
