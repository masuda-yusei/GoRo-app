class ProfilesController < ApplicationController
  before_action :authenticate_user!

  # GET /profiles
  def index
    admin = User.find_by(email:"admin@example.com")
    @q = Profile.ransack(params[:q])
    @profiles = @q.result(distinct: true)
  end

  # GET /profiles/1
  def create
    if current_user.profile.blank?
      @profile = Profile.new 
      @profile.user_id = current_user.id
    end
    @profile = Profile.find(params[:id]) if current_user.profile.present?
    if @profile.update(profile_params)
      redirect_to @profile, notice: t('notice.update', model: t('profile'))
    else
      render :edit
    end
  end

  def show
    if current_user.profile.blank?
      @profile = Profile.new 
      @profile.user_id = current_user.id
    end
    @profile = Profile.find(params[:id]) if current_user.profile.present?
    @blogs = @profile.user.blogs.order(updated_at: :desc).limit(4)
    @favorite = current_user.favorites.find_by(profile_id: @profile.id)
  end

  def edit
    if current_user.profile.blank?
      @profile = Profile.new 
      @profile.user_id = current_user.id
    end

    @profile = Profile.find(params[:profile_id]) if params[:profile_id].present?

    unless @profile.user.id == current_user.id
      redirect_to @profile, alert: "ユーザー本人以外は編集できません"
    end
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to @profile, notice: t('notice.update', model: t('profile'))
    else
      render :edit
    end
  end

  def favorite
    @favorites = current_user.favorites.page(params[:page]).per(3)
  end


  private
  
  def profile_params
    params.require(:profile).permit(:icon, :icon_cache, :gender, :birthday, :residence, :introduction, :golf_history, :average_score, :annual_round_time, :playable_date, :pick_up )
  end
end
