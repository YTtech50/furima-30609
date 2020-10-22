require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規商品の出品' do
    context '新規商品の出品がうまくいくとき' do
      it '全ての項目の入力が存在すれば出品できること' do
        expect(@item).to be_valid
      end

      it '販売価格が300円〜9,999,999円の間で半角入力であれば出品できること' do
        @item.item_price = '1234567'
        expect(@item).to be_valid
      end
    end

    context '新規商品の出品がうまくいかないとき' do
      it '商品名が無いと出品できないこと' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品の説明が無いと出品できないこと' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end

      it '商品画像が無いと出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'カテゴリーの情報が無いと出品できないこと' do
        @item.item_category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item category must be other than 1')
      end

      it '商品の状態についての情報が無ければ出品できないこと' do
        @item.item_sales_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item sales status must be other than 1')
      end

      it '配送料の負担についての情報が無ければ出品できないこと' do
        @item.item_shipping_fee_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item shipping fee status must be other than 1')
      end

      it '発送元の地域についての情報が無ければ出品できないこと' do
        @item.item_prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item prefecture must be other than 1')
      end

      it '発送までの日数についての情報が無ければ出品できないこと' do
        @item.item_scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item scheduled delivery must be other than 1')
      end

      it '価格についての情報が無ければ出品できないこと' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end

      it '販売価格は300円以上でなければ出品できないこと' do
        @item.item_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be greater than 300')
      end

      it '販売価格は9,999,999円以下でなければ出品できないこと' do
        @item.item_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be less than 9999999')
      end

      it '価格の入力は全角数字ではできないこと' do
        @item.item_price = '１２３４０'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
    end
  end
end
