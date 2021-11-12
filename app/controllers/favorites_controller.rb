class FavoritesController < ApplicationController
  def add_to_favorites
    current_user.favorites.build(movie_id: params[:movie_id]).save

    respond_to do |format|
      format.html { redirect_back fallback_location: root_url, notice: 'Movie was successfully added to your favorites.' }
      format.json { render :show, status: :created, location: @movie }
    end
  end

  def remove_from_favorites
    current_user.favorites.find_by(movie_id: params[:movie_id]).destroy

    respond_to do |format|
      format.html { redirect_back fallback_location: root_url, notice: 'Movie was successfully removed from your favorites.' }
      format.json { render :show, status: :created, location: @movie }
    end
  end
end
