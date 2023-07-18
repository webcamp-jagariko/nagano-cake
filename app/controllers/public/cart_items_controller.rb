class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    #@cart_item = CartItem.new(cart_item_params)
    #@cart_items = current_customer.cart_items
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.quantity += params[:cart_item][:quantity].to_i
      cart_item.save
      redirect_to public_cart_items_path

    elsif @cart_item.save
      @cart_items_all = current_customer.cart_items.all
      render '/public/items'
    else
      render '/public/items'
    end
  end

  def update
  end

  def destroy
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity, :customer_id)
  end

end
