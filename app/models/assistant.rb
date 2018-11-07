class Assistant < ApplicationRecord
    belongs_to :user
    belongs_to :event

    include AsJsonRepresentations

    representation :public do
        {
          id: id,
          user_id: user_id,
          event_id: event_id,
          pay_entry: pay_entry,
          auth_delivered: auth_delivered,
          auth_revised: auth_revised,
          paid_out: paid_out
        }
    end
end
