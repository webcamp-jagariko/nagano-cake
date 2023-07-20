class Admin::GenreSearchesController < ApplicationController
  
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @items = @genre.items.page(params[:page])
  end
end
