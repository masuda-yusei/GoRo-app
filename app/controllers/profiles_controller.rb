class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /profiles
  def index
    admin = User.find_by(email:"goro@gmail.com")
    @q = Profile.ransack(params[:q])
    @profiles = @q.result(distinct: true).where.not(id: admin.profile.id).includes(:place).order(updated_at: :desc).page(params[:page]).per(12)
  end

  # GET /profiles/1
  def show
    @blogs = @profile.user.blogs.order(updated_at: :desc).limit(4)
  end

  # GET /profiles/1/edit
  def edit
    unless @profile.user == current_user
      redirect_to @profile, alert: "ユーザー本人以外は編集できません"
    end
  end

  # PATCH/PUT /profiles/1
  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: t('notice.update', model: t('profile'))
    else
      render :edit
    end
  end

  private
  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:icon, :icon_cache, :gender, :birthday, :residence, :introduction)
  end
end
