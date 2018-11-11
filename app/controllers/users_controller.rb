class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate!
  
  # GET /users
  def index
    @users = User.filter_data(filter_params).paginate(paginate_params)

    render json: @users.as_json(representation: :public)
  end

  # GET /users/1
  def show
    render json: @user.as_json(representation: :public)
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :phone, :birthdate)
  end
  
  def filter_params
    params[:filter]&.permit(:name)
  end

  def paginate_params
    params[:page]&.permit(:number, :size)
  end

end
