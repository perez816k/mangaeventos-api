class Assistant < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :user_id, uniqueness: { scope: :event_id }

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

  scope :by_event_id, -> (id) { where("event_id = ?", id) }
  scope :by_paid_out, -> (paid) { where(:paid_out => ActiveModel::Type::Boolean.new.cast(paid)) }
  @joins_params_permited = {user: {table: :user, statement: "users.name"}}

  def self.filter_data(params)
    data = all

    return data unless params

    params.each do |filter_param, val|

      if @joins_params_permited.key? (filter_param.to_sym)
        join = @joins_params_permited[filter_param.to_sym]
        data = data.joins(join[:table]).where("#{join[:statement]} like '%#{val}%'")
      else
        data = data.send("by_#{filter_param}", val)
      end
    end
  
    return data
  end

  def self.paginate(params)
    data = all
    if params
      return data.page(params[:number]).per(params[:size])
    end
    return data
  end

end
