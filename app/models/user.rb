class User < ApplicationRecord
  has_many :assistants, foreign_key: [:user_id, :event_id]

  include AsJsonRepresentations
  include RailsJwtAuth::Authenticatable

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  #validates :birthdate, presence: true

  representation :public do
    {
      id: id,
      name: name,
      email: email,
      phone: phone,
      birthdate: birthdate
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
