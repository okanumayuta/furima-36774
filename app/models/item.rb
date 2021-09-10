class Item < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :catetory
  belongs_to :sales_status
  belongs_to :Shipping_fee_status
  belongs_to :Prefecture
  belongs_to :Scheduled_delivery

  validates :name, :price, :info, presence: true
  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :price, numericality: { in: 300..9999999 }
  validates :category_id, :sales_status_id, :Shipping_fee_status_id, :Prefecture_id, :Scheduled_delivery_id, numericality: { other_than: 0 , message: "can't be blank"} 
end
