class RecordsController < ApplicationController
  before_action :move_to_index
  before_action :get_item_infomation, only: [:index, :create]
  def index
    @record = ShippingRecord.new
  end

  def create

    @record = ShippingRecord.new(record_params)
    if @record.valid?
      pay_item
      @record.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def move_to_index
    @item = Item.find(params[:item_id])
    if (current_user.id != @item.user_id) || @item.record.present?
      redirect_to root_path
  end
  end

  def get_item_infomation
    @item = Item.find(params[:item_id])
  end

  def record_params
    params.permit(:postal_code, :shippingarea_id, :municipalities, :adress, :buildingname, :phonenumber, :item_id).merge(user_id: current_user.id, token: params[:token])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
