class ShippingRecord
  include ActiveModel::Model
  attr_accessor :postal_code, :shippingarea_id, :municipalities, :adress, :buildingname, :phonenumber, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code
    validates :municipalities
    validates :adress
    validates :phonenumber
    validates :token
  end

  validates :shippingarea_id, numericality: { other_than: 1 }  

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, shippingarea_id: shippingarea_id, municipalities: municipalities, adress: adress, buildingname: buildingname, phonenumber: phonenumber, record_id: record.id)
  end
    
  end