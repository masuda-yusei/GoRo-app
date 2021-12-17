class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    favorite = current_user.favorites.create(profile_id: params[:profile_id])
    redirect_to profile_path(params[:profile_id]), notice: "#{favorite.profile.user.name}さんをお気に入りしました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to profile_path(favorite.profile.id), notice: "#{favorite.profile.user.name}さんをお気に入りから解除しました"
  end
end