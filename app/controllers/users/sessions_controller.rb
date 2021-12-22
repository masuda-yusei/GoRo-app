# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :check_admin

  def new_guest
    user = User.guest
    sign_in user
    redirect_to profile_path(user.profile.id), notice: 'ゲストユーザーとしてログインしました'
  end

  def new_guest_admin
    user = User.guest_admin
    sign_in user
    redirect_to profile_path(user.profile.id), notice: 'ゲスト管理者ユーザーとしてログインしました'
  end

  def check_admin
    redirect_to tops_index_path, notice: 'アクセス権限がありません' if current_user.present?
  end
  
  # def destroy
  #   #ログアウトする（sessions_helperのlog_outメソッド）
  #   log_out
  #   #ルートURLにリダイレクト
  #   redirect_to root_url
  # end

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # private
  # def require_admin
  #   unless current_user.admin?
  #     redirect_to tops_index_path, notice: "管理者ではないためこのページにアクセスできません"
  #   end
  # end 

end
