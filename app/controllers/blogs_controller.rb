class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /blogs
  def index
    @q = Blog.ransack(params[:q])
    @blogs = @q.result(distinct: true).includes(:user).order(updated_at: :desc).page(params[:page]).per(4)
  end

  # GET /blogs/1
  def show
    @duration = ((Time.zone.now - @blog.created_at) / 3600).to_i
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
    unless @blog.user == current_user
      redirect_to @blog, alert: "投稿者以外は編集できません"
    end
  end

  # POST /blogs
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id

    if @blog.save
      redirect_to @blog, notice: t('notice.create', model: t('blog'))
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blogs/1
  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: t('notice.update', model: t('blog'))
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /blogs/1
  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: t('notice.destroy', model: t('blog'))
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :content)
    end
end
