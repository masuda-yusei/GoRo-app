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
end
