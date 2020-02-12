# frozen_string_literal: true

class UsersController < ApplicationController

  def index
    # @user = User.all
    @users = User.users_except_admin
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
    end
    redirect_to users_path
  end

  def update
    @user = User.find(params[:id])

    if @user.update
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :id,
      :name,
      :lastname,
      :phone,
      :city,
      :country,
      :role,
    )
  end
end