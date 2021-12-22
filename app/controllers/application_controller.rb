class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!
  # before_action :check_admin

  protect_from_forgery with: :null_session

  # def set_residence
  #   @residence = residence.all
  # end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def check_guest
    email = resource&.email || params[:user][:email].downcase
    if email == 'guest@example.com' || email == 'guest_admin@example.com'
      redirect_to edit_user_registration_path, alert: 'ゲストユーザーの変更・削除はできません。'
    end
  end

  # def after_sign_in_path_for(resource_or_scope)
  #   prorile_path(resource_or_scope.profile.id)
  # end


  # def after_sign_out_path_for(resource_or_scope)
  #   prorile_path(resource_or_scope.profile.id)
  # end

  # def admin_check
    # if @current_user.try(:admin?)
    #   redirect_to("/admin")
    # else
    # unless current_user.admin?
    #   flash[:warning]="管理者ユーザーではないためアクセスできません"
    #   redirect_to root_path
    # end
  # end

    # #ログインしてないとき実行される
    # def not_authenticated
    #   flash[:warning] = 'ログインしてください'
    #   redirect_to admin_login_path
    # end

    # #管理者権限がないユーザーを弾く
    # def check_admin
    #   redirect_to root_path, warning: '権限がありません' unless current_user.admin?
    # end
  
end
