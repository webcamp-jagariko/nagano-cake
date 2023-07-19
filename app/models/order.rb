class Order < ApplicationRecord
  
  belongs_to :customer
  
  validates :name, presence: true
  validates :address, presence: true
  validates :post_code, presence: true

  enum payment_method: { credit_card: 0, transfer: 1 }

end
