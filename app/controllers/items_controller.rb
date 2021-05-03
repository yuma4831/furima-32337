class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(item_params[:item_id])
  end
  private

  def item_params
    params.permit(:image, :name, :content, :price, :category_id, :condition_id, :shipping_fee_id,
                                 :shipping_area_id, :shipping_time_id)
  end
end
