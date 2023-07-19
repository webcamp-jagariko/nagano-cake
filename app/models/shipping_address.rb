class ShippingAddress < ApplicationRecord

  validates :name, presence: true
  validates :address, presence: true
  validates :post_code, presence: true

  belongs_to :customer
end
