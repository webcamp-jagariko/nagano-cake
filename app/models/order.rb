class Order < ApplicationRecord

  belongs_to :customer
  has_many :items, through: :order_details

  validates :name, presence: true
  validates :address, presence: true
  validates :post_code, presence: true

  enum payment_method: { credit_card: 0, transfer: 1 }
  
  enum status: {
     "入金待ち":0, 
     "入金確認":1, 
     "製作中":2, 
     "発送準備中":3, 
     "発送済み":4
  }

  def sum_of_price
    item.price_tax * quantity
  end

  def add_tax_price
    (self.price * 1.10).round
  end

end
