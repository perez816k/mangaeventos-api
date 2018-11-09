class Event < ApplicationRecord
  has_many :assistants, foreign_key: [:user_id, :event_id]

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

  scope :by_name, -> (name) { where("name like ?", "%#{name}%") }
  @joins_params_permited = {} #formato de los parametros del join -> user: {table: :user, statement: "users.name"}

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
