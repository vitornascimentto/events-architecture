class UsersController < ApplicationController
  def create
    service = CreateUser.build
    service.create!(name: client_name, admin: client_admin?)

    render json: { message: 'Cliente criado com sucesso!' }, status: :created
  rescue StandardError => e
    render json: { error: e.message }, status: :bad_request
  end

  private

  def user_params
    params.require(:user).permit(:name, :admin)
  end

  def client_name
    user_params[:name].presence || nil
  end

  def client_admin?
    return true if user_params[:admin] == 'true'

    false
  end
end
