class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @customer = current_customer
    @shipping_addresses = current_customer.shipping_addresses
  end

  def index

  end

  def complete

  end

  def confirm
    @order = Order.new(order_params)
    @address = ShippingAddress.find(params[:order][:address_id])
    @order.post_code = @address.post_code
    @order.address = @address.address
    @order.name = @address.name
    @cart_items = current_customer.cart_items
    @billing_amount = current_customer.cart_items.billing_amount(@cart_items)
  end

  def create

  end

  def show

  end

private

  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :name)
  end


end
