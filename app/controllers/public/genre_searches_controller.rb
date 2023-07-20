class Public::GenreSearchesController < ApplicationController

  def search
    @genres = Genre.all
    #@genre = Genre.find_by(params[:id])
    @genre_id = params[:genre_id]
    @items = Item.where(genre_id: params[:genre_id])
  end

end
