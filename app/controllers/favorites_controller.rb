class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
    favorite = current_user.favorites.create(user_id: params[:user_id])
    redirect_to users_path(prams[:user_id]), notice: "#{favorite.user.name}さんをいいねしました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to users_path(prams[:user_id]), notice: "#{favorite.user.name}さんのいいねを解除しました"
  end
end
