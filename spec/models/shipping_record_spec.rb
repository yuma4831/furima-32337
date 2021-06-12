require 'rails_helper'

RSpec.describe ShippingRecord, type: :model do
  before do
    sleep 2
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @shipping_record = FactoryBot.build(:shipping_record, item_id: @item.id, user_id: @user.id)
  end
  describe '購入機能' do
    context '購入がうまくいくとき' do
      it '郵便番号、住所（都道府県、市町村、番地）、電話番号、購入ユーザーid、購入商品id、トークンが存在すれば登録できる' do
        expect(@shipping_record).to be_valid
      end
      it '建物番号が空でも登録できる' do
        @shipping_record.buildingname = ''
        expect(@shipping_record).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it '郵便番号が空だと登録できない' do
        @shipping_record.postal_code = ''
        @shipping_record.valid?
        expect(@shipping_record.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号に「-」がないと登録できない' do
        @shipping_record.postal_code = '3310804'
        @shipping_record.valid?
        expect(@shipping_record.errors.full_messages).to include()
      end

      it '都道府県が空では登録できない' do
        @shipping_record.shippingarea_id = ''
        @shipping_record.valid?
        expect(@shipping_record.errors.full_messages).to include("Shippingarea is not a number")
      end

      it '市町村が空では登録できない' do
        @shipping_record.municipalities = ''
        @shipping_record.valid?
        expect(@shipping_record.errors.full_messages).to include("Municipalities can't be blank")
      end

      it '番地が空では登録できない' do
        @shipping_record.adress = ''
        @shipping_record.valid?
        expect(@shipping_record.errors.full_messages).to include("Adress can't be blank")
      end

      it '電話番号が空では登録できない' do
        @shipping_record.phonenumber = ''
        @shipping_record.valid?
        expect(@shipping_record.errors.full_messages).to include("Phonenumber can't be blank")
      end

      it '電話番号が12桁以上では登録できない' do
        @shipping_record.phonenumber = '000000000'
        @shipping_record.valid?
        expect(@shipping_record.errors.full_messages).to include()
      end

      it '購入したユーザのidが空では登録できない' do
        @shipping_record.user_id = ''
        @shipping_record.valid?
        expect(@shipping_record.errors.full_messages).to include()
      end
      it '購入商品のidが空では登録できない' do
        @shipping_record.item_id = ''
        @shipping_record.valid?
        expect(@shipping_record.errors.full_messages).to include()
      end

      it 'トークンが空では登録できない' do
        @shipping_record.token = ''
        @shipping_record.valid?
        expect(@shipping_record.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end