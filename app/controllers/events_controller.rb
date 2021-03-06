class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]
  before_action :authenticate!
  
  # GET /events
  def index
    @events = Event.filter_data(filter_params).paginate(paginate_params)

    render json: @events.as_json(representation: :public)
  end

  # GET /events/1
  def show
    render json: @event.as_json(representation: :public)
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def event_params
    params.require(:event).permit(:name, :description, :date, :location, :address, :price_ti, :price_bus, :state)
  end

  def filter_params
    params[:filter]&.permit(:name)
  end

  def paginate_params
    params[:page]&.permit(:number, :size)
  end

end
