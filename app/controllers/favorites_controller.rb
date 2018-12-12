class FavoritesController < ApplicationController
  def new
    @favorite = Favorite.new
  end
  def new_favorite
    @favorite = Favorite.new
    user_id = params[:id]
    user_fav = User.find(user_id)
    puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    puts user_fav.last_name
    puts "BBBBBBBBBBBBBBBBBBBBB"
    @favorite = Favorite.create(main_user: current_user, favorite_user: user_fav)
    redirect_to users_path
  end
end
