class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!

  def check_token
    if current_user.present?
      render json: current_user, status: :ok
    else
      render json: {}, status: :not_found
    end
  end

end