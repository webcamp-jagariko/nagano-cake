class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @customer = current_customer
    @shipping_addresses = current_customer.shipping_addresses
  end

  def index
    @orders = current_customer.orders.all
  end

  def complete

  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @total = 0
    @cart_items.each do |cart_item|
      @item = cart_item.item
      @subtotal = (@item.price* 1.10).round * cart_item.quantity
      @total += @subtotal
    end
    @postage = 800
    @total += 800

    if params[:order][:address_number] == "0"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + " " + current_customer.first_name
      render 'confirm'
    elsif params[:order][:address_number] == "1"
      @shipping_address = ShippingAddress.find(params[:order][:address_id])
      @order.post_code = @shipping_address.post_code
      @order.address = @shipping_address.address
      @order.name = @shipping_address.name
      render 'confirm'
    elsif params[:order][:address_number] == "2"
      @shipping_address = current_customer.shipping_addresses.new
      @shipping_address.address = params[:order][:address]
      @shipping_address.name = params[:order][:name]
      @shipping_address.post_code = params[:order][:post_code]
      @shipping_address.customer_id = current_customer.id
      if @shipping_address.save
        @order.post_code = @shipping_address.post_code
        @order.name = @shipping_address.name
        @order.address = @shipping_address.address
      else
       render 'new'
      end
    end

  end

def create
  @order = Order.new(order_params)
  @order.customer_id = current_customer.id
  @order.postage = 800
  @total = 0
  @cart_items = current_customer.cart_items
  item_details = []
    @cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      @item = cart_item.item
      order_detail.price_tax = @item.price
      order_detail.quantity = cart_item.quantity
      order_detail.item_id = cart_item.item_id
      item_details << order_detail
      @subtotal = (@item.price* 1.10).round * cart_item.quantity
      @total += @subtotal
    end
  @postage = 800
  @total += 800
  @order.billing_amount = @total
  if @order.save
    item_details.each do |order_detail|
      order_detail.order_id = @order.id
      order_detail.save
    end
    @cart_items.destroy_all
    redirect_to orders_complete_path
  else
    render 'new'
  end
end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end

private

  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :name)
  end


end
