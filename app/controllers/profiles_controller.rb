class ProfilesController < ApplicationController
  # before_action :set_profile, only: %i[show edit update]
  before_action :authenticate_user!
  # before_action :set_residence

  # GET /profiles
  def index
    admin = User.find_by(email:"admin@example.com")
    @q = Profile.ransack(params[:q])
    @profiles = @q.result(distinct: true)#.where.not(id: admin.profile.id).includes(:residence).order(updated_at: :desc).page(params[:page]).per(12)
  end

  # GET /profiles/1
  def create
    # user = User.find(current_user.id)
    # profile = user.build_profile(id: user.id)
    # @profile = Profile.new 
    # @profile.user_id = current_user.id
    # redirect_to @profile, notice: t('notice.update', model: t('profile'))
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
    # @users = @profile.users.order(updated_at: :desc).limit(4)
    @blogs = @profile.user.blogs.order(updated_at: :desc).limit(4)
    @favorite = current_user.favorites.find_by(profile_id: @profile.id)
  end

  # GET /profiles/1/edit
  def edit
    # params[:residence] = @profile.residence
    if current_user.profile.blank?
      @profile = Profile.new 
      @profile.user_id = current_user.id
    end

    @profile = Profile.find(params[:profile_id]) if params[:profile_id].present?

    unless @profile.user.id == current_user.id
      redirect_to @profile, alert: "ユーザー本人以外は編集できません"
    end
  end

  # PATCH/PUT /profiles/1
  def update
    # binding.irb
    # @profile.residence = residence_param
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
  # def set_profile
  #   @profile = Profile.find(params[:id])
  # end

  def profile_params
    params.require(:profile).permit(:icon, :icon_cache, :gender, :birthday, :residence, :introduction, :golf_history, :average_score, :annual_round_time, :playable_date, :pick_up )
  end
end
