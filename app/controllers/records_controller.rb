class RecordsController < ApplicationController
  before_action :get_item_infomation, only: [:index, :create]
  def index
    @records = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @record.valid?
      pay_item
      @record.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def get_item_infomation
    @item = Item.find(params[:item_id])
  end

  def record_params
    params.require(:record).permit(:postal_code, :shippingarea_id, :municipalities, :adress, :buildingname, :phonenumber).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: record_params[:price],  # 商品の値段
      card: record_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
