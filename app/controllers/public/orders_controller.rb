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
    @cart_items = current_customer.cart_items
    @total = 0


    if params[:order][:address_number] == "0"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + " " + current_customer.first_name
      render 'confirm'
    elsif params[:order][:address_number] == "1"
      @shipping_address = ShippingAddress.find(params[:order][:address_id])
      @order.post_code = @shipping_address.postcode
      @order.address = @shipping_address.address
      @order.name = @shipping_address.name
      render 'confirm'
    elsif params[:order][:address_number] == "2"
      @shipping_address = current_customer.shipping_address.new
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

  end

  def show

  end

private

  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :name)
  end


end
