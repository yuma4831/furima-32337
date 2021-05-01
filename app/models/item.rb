class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :shipping_fee, :shipping_area, :shipping_time, :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :price, numericality: { in: 300..9999999 }
    validates :image
    validates :content
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :shipping_area_id
    validates :shipping_time_id
  end


end
