class AssistantsController < ApplicationController
  before_action :set_assistant, only: [:show, :update, :destroy]

  # GET /assistants
  def index
    @assistants = Assistant.filter_data(filter_params).paginate(paginate_params)

    render json: @assistants.as_json(representation: :public)
  end

  # GET /assistants/1
  def show
    render json: @assistant.as_json(representation: :public)
  end

  # POST /assistants
  def create
    @assistant = Assistant.new(assistant_params)

    if @assistant.save
      render json: @assistant, status: :created, location: @assistant
    else
      render json: @assistant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /assistants/1
  def update
    if @assistant.update(assistant_params)
      render json: @assistant
    else
      render json: @assistant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /assistants/1
  def destroy
    @assistant.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_assistant
    @assistant = Assistant.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def assistant_params
    params.require(:assistant).permit(:user_id, :event_id, :pay_entry, :auth_delivered, :auth_revised, :paid_out)
  end

  def filter_params
    params[:filter]&.permit(:event_id, :user, :paid_out)
  end

  def paginate_params
    params[:page]&.permit(:number, :size)
  end

end
