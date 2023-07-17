class Item < ApplicationRecord

  has_one_attached :image

  has_many :cart_item, dependent: :destroy
  has_many :order_detail, dependent: :destroy
  belongs_to :genre

  validates :name, presence:true
  validates :price, presence:true


  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
      image
  end

  def add_tax_price
    (self.price * 1.10).round
  end

end
