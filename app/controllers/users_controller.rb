class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  # GET /users
  def show
    @user = User.find(params[:id])
  end

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(3)
    @users = User.where.not(id: current_user.id)
    @user = User.find(current_user.id)
  end

  private
  # def require_admin
  #   unless current_user.admin?
  #     redirect_to tops_index_path, notice: "管理者ではないためこのページにアクセスできません"
  #   end
  # end  

end
