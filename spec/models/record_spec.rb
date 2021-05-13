require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    @record = FactoryBot.build(:record)
  end
  describe '購入機能' do
    context '購入がうまくいくとき' do
      it '郵便番号、住所（都道府県、市町村、番地）、電話番号、購入ユーザーid、購入商品id、トークンが存在すれば登録できる' do
        expect(@record).to be_valid
      end
      it '建物番号が空でも登録できる' do
        @record.buildingnumber = ''
        expect(@record).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it '郵便番号が空だと登録できない' do
        @record.postal_code = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("Postal code can't be blank", 'Postal code には - を含めて設定してください')
      end

      it '郵便番号に「-」がないと登録できない' do
        @reord.postal_code = '3310804'
        @record.valid?
        expect(@record.errors.full_messages).to include('Postal code には - を含めて設定してください')
      end

      it '都道府県が空では登録できない' do
        @record.shippingarea_id = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("Shippingarea can't be blank")
      end

      it '市町村が空では登録できない' do
        @record.municipalities = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では登録できない' do
        @record.adress = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("Address line can't be blank")
      end

      it '電話番号が空では登録できない' do
        @record.phonenumber = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が12桁以上では登録できない' do
        @record.phonenumber = '000000000'
        @record.valid?
        expect(@record.errors.full_messages).to include('Phone number を正しく入力してください')
      end

      it '購入したユーザのidが空では登録できない' do
        @record.user_id = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("User can't be blank")
      end
      it '購入商品のidが空では登録できない' do
        @record.item_id = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("Item can't be blank")
      end

      it 'トークンが空では登録できない' do
        @record.token = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end