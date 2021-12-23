class UsersController < ApplicationController
  before_action :authenticate_user!
  # GET /users
  def show
    # @user = User.find(params[:id])
    @user = User.find(current_user.id)

  end

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(3)
    @users = User.where.not(id: current_user.id)
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to profile_path, notice: "ユーザー情報を編集しました！"
    else
      render :edit
    end
  end


  def destroy
    session.delete(:user_id)
    # @current_user = nil
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


  # private
  # def require_admin
  #   unless current_user.admin?
  #     redirect_to tops_index_path, notice: "管理者ではないためこのページにアクセスできません"
  #   end
  # end  

end