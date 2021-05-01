class ItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    @item = Item.new(article_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :shipping_time_id)
  end
end 
