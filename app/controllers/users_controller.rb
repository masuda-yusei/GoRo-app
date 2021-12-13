class UsersController < ApplicationController
  before_action :authenticate_user!
  # GET /users
  def show
    @user = User.find(params[:id])
  end

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
    @users = User.where.not(id: current_user.id)
    @user = User.find(current_user.id)
  end
end
