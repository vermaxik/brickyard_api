class Api::V1::SessionsController < ApplicationController

  # POST /api/v1/authenticate
  def create
    user = User.find_by_login(params[:login])
    if user && user.authenticate(params[:password])
      render json: user
    else
      render json: 'error', status: :unprocessable_entity
    end
  end

  # GET /api/v1/authenticate/:token_id
  def user_by_token
    user = User.find_by_token(params[:token_id])
    if user
      render json: user
    else
      render json: 'error', status: :unprocessable_entity
    end
  end

end
