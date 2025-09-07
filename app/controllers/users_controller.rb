class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 201  # instead of :created
    else
      render json: { errors: user.errors.full_messages }, status: 422  # instead of :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:username, :email, :first_name, :last_name, :password, :password_confirmation)
  end
end

