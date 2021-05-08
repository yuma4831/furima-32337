class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shippingfee
  belongs_to_active_hash :shippingarea
  belongs_to_active_hash :shippingtime
  belongs_to :user
  has_one_attached :image
  has_one :record

  with_options presence: true do
    validates :name
    validates :price, numericality: { in: 300..9_999_999 }
    validates :image
    validates :content
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shippingfee_id
    validates :shippingarea_id
    validates :shippingtime_id
  end
end
