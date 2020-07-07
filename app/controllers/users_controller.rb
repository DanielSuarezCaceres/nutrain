# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    # @user = User.all
    if current_user.type == 'Professional'
      @q = Client.ransack(params[:q])
      @pagy, @users = pagy(@q.result)
      #@pagy, @users = User.users_except_admin(current_user.id)
    else
      @q = Professional.ransack(params[:q])
      @pagy, @users, = pagy(@q.result)
      #@users = User.only_professionals
    end
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
      :gender,
      :age,
      :height,
      :weight,
      :phone,
      :city,
      :country,
      :description,
      :nutritionist,
      :trainer,
      :physiotherapist,
      :psychologist,
      :verified,
      :type,
      :current_password,
      :email
    )
  end
end