class Public::CustomersController < ApplicationController
before_action :authenticate_customer!, except: [:top, :homes]

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    customer = Customer.find(current_customer.id)
    if customer.update(customer_params)
      flash[:notice] = "会員情報が編集されました"
      redirect_to customers_mypage_path
    else
      @customer = customer
      render :edit
    end
  end

  def confirm
  end



  def withdraw
  end

  private

  def customer_params
    params.require(:customer).permit(
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :post_code,
      :address,
      :phone_number,
      :email
      )
  end

end
