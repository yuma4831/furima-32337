require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '出品登録' do
    context '出品登録ができる時' do
      it '全ての欄が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品登録できない時' do
      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
      end
      it '出品名が空では登録できない' do
        @item.name = ''
        @item.valid?
      end
      it '商品の説明が空では登録できない' do
        @item.content = ''
        @item.valid?
      end
      it '商品のカテゴリー空では登録できない' do
        @item.category_id = '1'
        @item.valid?
      end
      it '商品の状態が空では登録できない' do
        @item.condition_id = '1'
        @item.valid?
      end
      it '配送料の負担が空だと登録できない' do
        @item.shipping_fee_id = '1'
        @item.valid?
      end
      it '発送元の地域が空では登録できない' do
        @item.shipping_area_id = '1'
        @item.valid?
      end
      it '発送までの日数が空では登録できない' do
        @item.shipping_time_id = '1'
        @item.valid?
      end
      it '価格が空では登録できない' do
        @item.price = ''
        @item.valid?
      end
      it '価格が300円未満では登録できない' do
        @item.price = '100'
        @item.valid?
      end
      it '価格が9,999,999円を超えていたら登録できない' do
        @item.price = '10000000'
        @item.valid?
      end
    end
  end
end
