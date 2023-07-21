class Admin::GenreSearchesController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @items = @genre.items.page(params[:page])
  end
end
