class RegistrationsController < RailsJwtAuth::RegistrationsController

  private
  def registration_create_params
    params.require(:user).permit(:name, :birthdate, :email, :password)
  end

end
