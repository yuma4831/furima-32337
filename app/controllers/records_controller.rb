class RecordsController < ApplicationController

  def index
    @records = Order.new
  end

  def create
    @record = Order.new(record_params)
    if @record.valid?
      pay_item
      @record.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

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
