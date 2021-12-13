class GolfInformationsController < ApplicationController
  before_action :set_golf_information, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /golf_informations
  def index
    @q = Golf_Information.ransack(params[:q])
    @golf_informations = @q.result(distinct: true)
  end

  # GET /golf_informations/1
  def show
  end

  # GET /golf_informations/new
  def new
    @golf_information = Golf_Information.new
  end

  # GET /golf_informations/1/edit
  def edit
  end

  # POST /golf_informations
  def create
    @golf_information = Golf_Information.new(golf_information_params)
    @golf_information.user_id = current_user.id
    if @golf_information.save
      redirect_to @golf_information, notice: 'Golf_Information was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /golf_informations/1
  def update
    if @golf_information.update(golf_information_params)
      redirect_to @golf_information, notice: 'Golf_Information was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /golf_informations/1
  def destroy
    @golf_information.destroy
    redirect_to golf_informations_url, notice: 'Golf_Information was successfully destroyed.'
  end

  private
    def set_golf_information
      @golf_information = Golf_Information.find(params[:id])
    end

    def golf_information_params
      params.require(:golf_information).permit(:golf_history, :average_score, :annual_round_times, :play_area, :playable_date, :playable_date)
    end
end
