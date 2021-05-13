require 'rails_helper'

RSpec.describe ShippingRecord, type: :model do
  before do
    @record = FactoryBot.build(:shipping_record)
  end
  describe '購入機能' do
    context '購入がうまくいくとき' do
      it '郵便番号、住所（都道府県、市町村、番地）、電話番号、購入ユーザーid、購入商品id、トークンが存在すれば登録できる' do
        expect(@record).to be_valid
      end
      it '建物番号が空でも登録できる' do
        @record.buildingname = ''
        expect(@record).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it '郵便番号が空だと登録できない' do
        @record.postal_code = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号に「-」がないと登録できない' do
        @record.postal_code = '3310804'
        @record.valid?
        expect(@record.errors.full_messages).to include()
      end

      it '都道府県が空では登録できない' do
        @record.shippingarea_id = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("Shippingarea is not a number")
      end

      it '市町村が空では登録できない' do
        @record.municipalities = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("Municipalities can't be blank")
      end

      it '番地が空では登録できない' do
        @record.adress = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("Adress can't be blank")
      end

      it '電話番号が空では登録できない' do
        @record.phonenumber = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("Phonenumber can't be blank")
      end

      it '電話番号が12桁以上では登録できない' do
        @record.phonenumber = '000000000'
        @record.valid?
        expect(@record.errors.full_messages).to include()
      end

      it '購入したユーザのidが空では登録できない' do
        @record.user_id = ''
        @record.valid?
        expect(@record.errors.full_messages).to include()
      end
      it '購入商品のidが空では登録できない' do
        @record.item_id = ''
        @record.valid?
        expect(@record.errors.full_messages).to include()
      end

      it 'トークンが空では登録できない' do
        @record.token = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end