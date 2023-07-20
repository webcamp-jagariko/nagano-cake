class Public::GenreSearchesController < ApplicationController

  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @items = @genre.items
  end

end
