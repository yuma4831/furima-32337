class Shipping < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shippingarea
  belongs_to :record

  with_options presence: true do
    validates :postal_code
    validates :municipalities
    validates :adress
    validates :phonenumber
  end


  validates :shippingarea_id, numericality: { other_than: 1 }  
end
