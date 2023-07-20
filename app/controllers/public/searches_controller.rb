class Public::SearchesController < ApplicationController

  def search
    @word = params[:word]
    @items = Item.where('name LIKE ?', "%#{@word}%")
    @genres = Genre.all
  end
end
