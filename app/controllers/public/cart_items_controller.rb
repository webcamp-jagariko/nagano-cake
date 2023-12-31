class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.quantity += params[:cart_item][:quantity].to_i
      cart_item.save
      flash[:notice] = "商品を追加しました"
      redirect_to cart_items_path

    elsif @cart_item.save
      flash[:notice] = "商品を追加しました"
      @cart_items_all = current_customer.cart_items.all
      redirect_to cart_items_path

    else

      render 'items/show'
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    @cart_items = CartItem.all
    flash[:notice] = "商品を削除しました"
    redirect_to cart_items_path
  end

  def all_destroy
    cart_items = CartItem.all
    cart_items.destroy_all
    flash[:notice] = "商品を削除しました"
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity, :customer_id)
  end

end
