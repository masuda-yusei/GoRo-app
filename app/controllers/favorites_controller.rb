class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(user_id: params[:user_id])
    redirect_to users_path, notice: "#{favorite.user.name}の投稿をいいねしました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to users_path, notice: "#{favorite.user.name}の投稿のいいねを解除しました"
  end
end
