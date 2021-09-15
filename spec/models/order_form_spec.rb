require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id )
    sleep 0.2
  end

  describe '商品購入情報の保存' do
    context '商品購入情報が保存できる場合' do
      it '全ての情報が存在する場合に保存ができる' do
        expect(@order_form).to be_valid
      end

      it '建物名が空でも保存ができる' do
        @order_form.building = ''
        expect(@order_form).to be_valid
      end
    end

    context '商品購入情報が保存できない場合'do
      it '郵便番号が空では保存できない' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Postal code can't be blank"
      end

      it '郵便番号が3桁ハイフン4桁以外では保存できない' do
        @order_form.postal_code = '12-34567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Postal code is invalid"
      end

      it '郵便番号が半角文字列以外では保存できない' do
        @order_form.postal_code = '12ー34567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Postal code is invalid"
      end

      it '都道府県が空では保存できない' do
        @order_form.prefecture_id = '0'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Prefecture can't be blank"
      end
      
      it '市区町村が空では保存できない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "City can't be blank"
      end
     
      it '番地が空では保存できない' do
        @order_form.addresses = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Addresses can't be blank"
      end

      it '電話番号が空では保存できない' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Phone number can't be blank"
      end

      it '電話番号が9桁以下では保存できない' do
        @order_form.phone_number = '123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Phone number is invalid"
      end

      it '電話番号が12桁以上では保存できない' do
        @order_form.phone_number = '123456789123'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Phone number is invalid"
      end

      it 'user_idが紐づいていなければ保存できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "User can't be blank"
      end

      it 'item_idが紐づいていなければ保存できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
