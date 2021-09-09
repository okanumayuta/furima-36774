require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nickname,emailpassword,password_confirmation,first_name,last_name,first_name_kana,last_name_kana,birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'emailが重複していては登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が無くては登録できない' do
        @user.email = 'aaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it 'passwordが全角文字を含んでは登録できない' do
        @user.password = 'aaaAaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it 'passwordが半角カタカナを含んでは登録できない' do
        @user.password = 'aaaｱaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'aaa111'
        @userpassword_confirmation = 'aaa2222'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'first_nameが半角英数字では登録できない' do
        @user.first_name = 'aaa111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end
      it 'last_nameが半角英数字では登録できない' do
        @user.last_name = 'aaa111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end
      it 'first_name_kanaが半角英数字では登録できない' do
        @user.first_name_kana = 'aaa111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end
      it 'first_name_kanaが漢字では登録できない' do
        @user.first_name_kana = '阿阿'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end
      it 'first_name_kanaがひらがなでは登録できない' do
        @user.first_name_kana = 'ああ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end
      it 'last_name_kanaが半角英数字では登録できない' do
        @user.last_name_kana = 'aaa111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end
      it 'last_name_kanaが漢字では登録できない' do
        @user.last_name_kana = '阿阿'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end
      it 'last_name_kanaがひらがなでは登録できない' do
        @user.last_name_kana = 'ああ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
    end
  end
end
