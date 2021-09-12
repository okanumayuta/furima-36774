require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'itemの保存' do
    context 'itemが出品できる場合' do
      it '全ての情報が存在する場合に出品ができる' do
        expect(@item).to be_valid
      end
    end

    context 'itemが出品できない場合'
    it '商品画像が空では出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it '商品名が空では出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end
    it '商品の説明が空では出品できない' do
      @item.info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Info can't be blank"
    end
    it 'カテゴリーが選択されていないと出品できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it '商品の状態が選択されていないと出品できない' do
      @item.sales_status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Sales status can't be blank"
    end
    it '配送料負担が選択されていないと出品できない' do
      @item.shipping_fee_status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping fee status can't be blank"
    end
    it '発送元の地域が選択されていないと出品できない' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture can't be blank"
    end
    it '発送までの日数が選択されていないと出品できない' do
      @item.scheduled_delivery_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Scheduled delivery can't be blank"
    end
    it '価格が空では出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it '価格が299円以下では出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
    end
    it '価格が10000000円以上では出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
    end
    it '価格は全角数字では出品できない' do
      @item.price = '１１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price is not a number'
    end
    it '価格は半角カタカナでは出品できない' do
      @item.price = 'ｱｱｱｱ'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price is not a number'
    end
    it 'userが紐づいていなければ出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include 'User must exist'
    end
  end
end
