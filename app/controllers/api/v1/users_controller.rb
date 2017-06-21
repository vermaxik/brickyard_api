class Api::V1::UsersController < ApplicationController

  # PUT /api/v1/state
  def change_state
    user = User.find_by_token(params[:token_id])
    raise ActiveRecord::RecordNotFound if user.nil?
    new_state = Main.find(params[:main_id])

    if params[:reset] == true || new_state.position - user.main.position == 1
      user.update(main: new_state)
      render json: user
    else
      render json: {message: 'Sorry, your state not accessible. Follow the order of state.'},
              status: :unprocessable_entity
    end
  end
end
