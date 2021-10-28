class Item < ApplicationRecord

  attachment :image

  belongs_to :genre

  has_many :cart_items, dependent: :destroy
  has_many :order_datails, dependent: :destroy

   def add_tax_price
       (self.price * 1.10).round
   end

   def is_active_text
     if is_active == true
       "販売中"
     else
       "販売停止中"
     end
   end

  validates :name, presence: true
  validates :introduction, presence: true
  validates :image, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true
  validates :is_active, presence: true


end
