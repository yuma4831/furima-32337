require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context 'ユーザー登録ができる時' do
      it '全ての欄が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        expect(@user).to be_valid
      end
    end
    context 'ユーザー登録できない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
      end
      it 'emailに＠がないと登録できない' do
        @user.email = 'test'
        @user.valid?
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aaa00'
        @user.password_confirmation = 'aaa00'
        @user.valid?
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
      end
      it 'passwordが全角では登録できない' do
        @user.password = 'ああああaaaa0000'
        @user.password_confirmation = 'ああああaaaa0000'
        @user.valid?
      
      end
    end
  end
  describe 'ユーザー本人情報確認' do
    it 'ユーザー名字が空では登録できない' do
      @user.lastname = ''
      @user.valid?
    end
    it 'ユーザー名前が空では登録できない' do
      @user.firstname = ''
      @user.valid?
    end
    it 'ユーザー名字が半角では登録できない' do
      @user.lastname = 'aaaa'
      @user.valid?
    end
    it 'ユーザー名前が半角では登録できない' do
      @user.firstname = 'aaaa'
      @user.valid?
    end
    it 'ユーザー名字のフリガナが空では登録できない' do
      @user.lastname_kana = ''
      @user.valid?
    end
    it 'ユーザー名前のフリガナが空では登録できない' do
      @user.firstname_kana = ''
      @user.valid?
    end
    it 'ユーザー名字が半角では登録できない' do
      @user.lastname_kana = 'aaaa'
      @user.valid?
    end
    it 'ユーザー名前が半角では登録できない' do
      @user.firstname_kana = 'aaaa'
      @user.valid?
    end
    it '生年月日が空では登録できない' do
      @user.birthday = ''
      @user.valid?
    end
  end
end
