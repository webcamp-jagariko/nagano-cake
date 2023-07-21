class Order < ApplicationRecord

  belongs_to :customer
  has_many :items, through: :order_details

  validates :name, presence: true
  validates :address, presence: true
  validates :post_code, presence: true

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum status: {
     wait_payment: 0,
     payment_check: 1,
     producing: 2,
     prepare_shipping: 3,
     shipped: 4
  }, _prefix: true

  def sum_of_price
    item.price_tax * quantity
  end

  def add_tax_price
    (self.price * 1.10).round
  end

end
