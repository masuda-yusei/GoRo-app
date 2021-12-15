class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /profiles
  def index
    @q = Profile.ransack(params[:q])
    @profiles = @q.result(distinct: true)
  end

  # GET /profiles/1
  def show
    @blogs = @profile.user.blogs.order(updated_at: :desc).limit(4)
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to @profile, notice: t('notice.create', model: t('profile'))
    else
      render :new
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

  # DELETE /profiles/1
  def destroy
    @profile.destroy
    redirect_to profiles_url, notice: t('notice.destroy', model: t('profile'))
  end

  private
    def set_profile
      profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:icon, :icon_cache, :gender, :birthday, :residence, :introduction)
    end
end
