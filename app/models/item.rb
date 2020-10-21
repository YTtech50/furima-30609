class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_category
  belongs_to_active_hash :item_sales_status
  belongs_to_active_hash :item_shipping_fee_status
  belongs_to_active_hash :item_prefecture
  belongs_to_active_hash :item_scheduled_delivery

  validates :item_name, :item_info, :item_category, :item_sales_status, :item_shipping_fee_status, :item_prefecture, :item_scheduled_delivery, :item_price, :image, presence: true
  validates :item_category_id, numericality: { other_than: 1 } 
  validates :item_sales_status_id, numericality: { other_than: 1 } 
  validates :item_shipping_fee_status_id, numericality: { other_than: 1 } 
  validates :item_prefecture_id, numericality: { other_than: 1 } 
  validates :item_scheduled_delivery_id, numericality: { other_than: 1 } 
  validates :item_price, numericality: { greater_than: 300, less_than: 9999999 }
  validates :item_price, format: { with: /\A[0-9]+\z/ }
end
